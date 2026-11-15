# grafik_liste.py - erfasst Ordnerstruktur, Dateinamen und Bildgroessen.
# Liest nur, aendert nichts. Ergebnis: grafik_liste.txt neben diesem Skript.
# Aufruf:  python grafik_liste.py "C:\Pfad\zu\den\Grafiken"
#          (ohne Pfad gestartet, fragt das Skript danach)
import os
import re
import struct
import sys
from collections import Counter

arg = sys.argv[1] if len(sys.argv) > 1 else input("Pfad zum Grafikordner: ")
root = os.path.abspath(arg.strip().strip('"'))
if not os.path.isdir(root):
    sys.exit("Ordner nicht gefunden: " + root)

out, ext_count, size_count = [], Counter(), Counter()
LAST_NUM = re.compile(r"\d+(?=\D*$)")


def image_info(path, ext):
    """Bildgroesse aus den ersten Bytes lesen (kein Bild wird geladen)."""
    try:
        with open(path, "rb") as f:
            b = f.read(32)
        if ext == ".png" and b[12:16] == b"IHDR":
            return "%dx%d" % struct.unpack(">II", b[16:24])
        if ext == ".gif" and b[:3] == b"GIF":
            return "%dx%d" % struct.unpack("<HH", b[6:10])
        if ext in (".aseprite", ".ase") and struct.unpack("<H", b[4:6])[0] == 0xA5E0:
            frames, w, h = struct.unpack("<HHH", b[6:12])
            return "%dx%d %d Frames" % (w, h, frames)
    except (OSError, struct.error):
        pass
    return ""


def natural(name):
    """Sortierschluessel: run_2 kommt vor run_10."""
    return [int(t) if t.isdigit() else t.lower() for t in re.split(r"(\d+)", name)]


def walk(folder):
    try:
        entries = sorted((e for e in os.scandir(folder) if not e.name.startswith(".")),
                         key=lambda e: natural(e.name))
    except OSError:
        return
    groups = {}
    for e in entries:
        if not e.is_file():
            continue
        base, ext = os.path.splitext(e.name)
        ext = ext.lower()
        if ext == ".import":  # Godot-Hilfsdateien ueberspringen
            continue
        info = image_info(e.path, ext)
        ext_count[ext or "(ohne)"] += 1
        if info:
            size_count[info] += 1
        # Nummerierte Reihen (run_01, run_02, ...) zu einer Zeile zusammenfassen
        m = LAST_NUM.search(base)
        key = (LAST_NUM.sub("\0", base, count=1) + ext, info)
        groups.setdefault(key, []).append((e.name, m.group() if m else ""))
    out.append("[%s]" % os.path.relpath(folder, root).replace(os.sep, "/"))
    for (pattern, info), files in groups.items():
        suffix = " " + info if info else ""
        if len(files) >= 3:
            span = "{%s..%s}" % (files[0][1], files[-1][1])
            out.append("  %s%s  (%d Dateien)" % (pattern.replace("\0", span), suffix, len(files)))
        else:
            out.extend("  %s%s" % (name, suffix) for name, _ in files)
    for e in entries:
        if e.is_dir(follow_symlinks=False):
            walk(e.path)


def top(counter):
    return ", ".join("%s: %d" % kv for kv in counter.most_common(30))


walk(root)
total = sum(ext_count.values())
out += ["", "DATEIEN: %d" % total, "TYPEN: " + top(ext_count), "BILDGROESSEN: " + top(size_count)]
target = os.path.join(os.path.dirname(os.path.abspath(__file__)), "grafik_liste.txt")
with open(target, "w", encoding="utf-8") as f:
    f.write("\n".join(out))
print("%d Dateien erfasst -> %s (%d Zeilen)" % (total, target, len(out)))
