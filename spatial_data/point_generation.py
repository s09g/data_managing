#! -*- coding : utf-8 -*-
from math import cos, sin, pi

def generate_points(R=5, r=1, a=4, nRev=10):
    def x():
        return (R + r) * cos((r/R) * t) - a * cos((1 + r/R) * t)
    def y():
        return (R + r) * sin((r/R) * t) - a * sin((1 + r/R) * t)

    points = []
    offset = {'x':-118.289261, 'y':34.021263 }
    for i in range(0, int(100 * pi * nRev)):
        t = i / 100
        curtX = x()/10e3 * 2 + offset['x']
        curtY = y()/10e3 * 2 + offset['y']
        points.append((curtX, curtY))
    return points


def make_kml(points, file_name="spiro.kml"):
    height = 60
    file = open(file_name, 'w')
    head = """<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2">
    <Document>
    <name>Spiro</name>
    <Style id="yellowLineGreenPoly">
    <LineStyle>
    <color>7f00ffff</color>
    <width>4</width>
    </LineStyle>
    </Style>
    <Placemark>
    <name>SpirographCurve</name>
    <styleUrl>#yellowLineGreenPoly</styleUrl>
    <LineString>
    <extrude>1</extrude>
    <tessellate>1</tessellate>
    <altitudeMode>absolute</altitudeMode>
    <coordinates>"""
    foot = """</coordinates>
    </LineString>
    </Placemark>
    </Document>
    </kml>"""
    file.write(head)
    for x, y in points:
        line = "{0},{1},{2}\n".format(x, y, height)
        file.write(line)
    file.write(foot)
    file.close()


if __name__ == '__main__':
    points = generate_points()
    make_kml(points)
