RS-232 Sniffer Box
==================

This repository contains schematics, a PCB layout, and 3D-printable box
for a "RS-232 Sniffer" that my friend Chris asked me to design in 2019.

Chris needed a way to sniff the traffic between two serial devices,
and to get a visual indication as to which signals were active.

A little bit of mucking around in [KiCad](https://www.kicad.org/) and
[OpenSCAD](https://openscad.org/) and I had a design.  Chris later
improved on my original 3D-printable box design.

Multiple copies of the box have been made and have seen heavy use at
our workplace for monitoring serial communications; particularly for
SCADA systems.

The boxes have also proven useful to check if serial ports are working
at all, and to track down problems with RTS/CTS handshaking and the like.

<img alt="RS-232 Sniffer Box" src="photos/rs232-sniffer.jpg" width="860"/>

## Capabilities

* Pass-through from one end of the box to the other for the main
serial communications path.
* Two extra serial ports for monitoring the RX and TX sides of the
communications.  Any bytes that are sent on that side are also sent
to the "sniffer" ports, for monitoring on a connected PC using a
terminal program like [PuTTY](https://www.putty.org/).
* Optional null modem connection to cross-over RX and TX.
* Red and green LED's to indicate which RS-232 lines have a high or
low signal on them.
* Probe points to monitor the RS-232 signals on an oscilloscope.

Note that this is a sniffer rather than a breakout box, so it isn't
possible to reroute the signals from one end to the other.  All serial
ports are assumed to use the standard IBM RS-232 DB9 arrangement.

## Schematics

The KiCad schematics are in the `schematics/RS232Sniffer` directory.
The PDF version can be found [here](schematics/RS232Sniffer/PDF/RS232Sniffer.pdf).

## Gerber Files

The Gerber files can be found in the `schematics/RS232Sniffer/Gerber` directory.

## Parts List

<table border="1">
<tr><td><b>Part</b></td><td><b>Quantity</b></td><td><b>Designators</b></td></td></tr>
<tr><td>PCB</td><td>1</td><td>N/A</td></tr>
<tr><td>3mm Red LED</td><td>8</td><td>D1,D3,D5,D7,D9,D11,D13,D15 (top row)</td></tr>
<tr><td>3mm Green LED</td><td>8</td><td>D2,D4,D6,D8,D10,D12,D14,D16 (bottom row)</td></tr>
<tr><td>DB9 female connector</td><td>4</td><td>J1,J2,J3,J5</td></tr>
<tr><td>DB9 male connector</td><td>1</td><td>J4</td></tr>
<tr><td>8-pin 2.54mm terminal header or socket</td><td>1</td><td>J6</td></tr>
<tr><td>2-pin 2.54mm terminal header or socket</td><td>1</td><td>J7</td></tr>
<tr><td>1.2k Resistor, either 1/4W or 1/2W</td><td>8</td><td>R1,R2,R3,R4,R5,R6,R7,R8</td></tr>
<tr><td>SPDT slide switch or 3-pin terminal header, 2.54mm pitch</td><td>1</td><td>SW1 (normally set to the "Thru" position)</td></tr>
</table>

Jaycar has the DB9 connectors as part codes PS-0806 (female) and
PP-0803 (male).

## 3D-Printable Box

* [STL file for the box](box/RS232SnifferBox.stl)
* [OpenSCAD file for the box](box/RS232SnifferBox.scad)

Use metal sheet screws to affix the PCB to the bottom of the box.
The mounting holes may need to be drilled out a little depending upon
the type of screws you are using.

A lid cut from transparent acrylic sheet completes the look.

## License

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><span property="dct:title">RS-232 Sniffer</span> by <span property="cc:attributionName">Rhys Weatherley</span> is licensed under <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution-NonCommercial-ShareAlike 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"></a></p>

## Contact

For more information on this project, or to suggest improvements,
please contact the author Rhys Weatherley via
[email](mailto:rhys.weatherley@gmail.com).
