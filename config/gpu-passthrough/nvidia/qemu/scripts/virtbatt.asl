// ASL example
// http://www.acpi.info/DOWNLOADS/ACPI_5_Errata%20A.pdf
//
// DSDT or SSDT ?
// SSDT is "Better" though if guest ignores batteries and psu defined there,
// somehow augment DSDT in Seabios
//
// compile via "iasl virtbatt.asl" and load virtbatt.aml as an SSDT into KVM
// disassemble via "iasl virtbatt.aml" to virtbatt.dsl that can be compared with original virtbatt.asl
//  <qemu:commandline>
//    <qemu:arg value='-acpitable'/>
//    <qemu:arg value='file=/var/lib/libvirt/images/virtbatt/virtbatt.aml'/>
//  </qemu:commandline>
//
// GNU/Linux re-reads SSDT upon boot, w10 needs "Reset this PC" to see changes.

DefinitionBlock ("virtbatt.aml", "SSDT", 0x1, "BOCHS ", "BXPCDSDT", 0x00000001)
{
 Scope (\_SB) { // System board
  Device (ADP1) // AC adapter 1
  {
   Name (_HID, "ACPI0003" /* Power Source Device */)  // tell the os it is an ac adapter
   Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
   {
    _SB // this ac adapter powers the system board
   })
   Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
   {
    Return (One)	// One means on supply, Zero means not on supply (likely on battery)
   }
   Method (_PIF, 0, NotSerialized)
   {
    Name (STAT, Package (0x06)
    {
     0x0, // not multi input or multi output
     0xFFFFFFFF, // do not know max output power
     0xFFFFFFFF, // do not know max input power
     "Virtual PSU Model",
     "Virtual PSU Serial Number",
     "Virtual PSU Manufacturer"
    })
    Return (STAT)
   }
  }
  Device (BAT1) // Battery 1
  {
   Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // tell the OS it is a battery
   Name (_UID, One)  // _UID: Unique ID
   Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
   {
     _SB // this battery powers the system board
   })
   Name (SCID, 0x05)
    // see in http://www.acpi.info/DOWNLOADS/ACPI_5_Errata%20A.pdf page 308
   Method (_STA, 0, NotSerialized)  // _STA: Status - 1F means battery present, 0F not present
   {
    Return (0x1F)
   }
   Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
   {
    Name (STAT, Package (0x0D)
    {
     One,   // 1 = current (amperes), 0 = power (watts)
     0x2328, // 9 Ah = design capacity
     0x2328, // last charge capacity
     One,    // 1 = rechargeable, 0 = not rechargeable
     0x2ee0, // tension in 12 volts in millivolts
     0x01A4, // warning level 
     0x9C,   // low level ( 2 minutes on APC)
     0x4, // granu 1
     0x8, // granu 2
     "Virtual Model", 
     "Virtual Serial Number", 
     "Imaginary Battery Chemistry", 
     "Virtual Battery Manufacturer"
    })
    Return (STAT)
   }
   Method (_BST, 0, NotSerialized)  // _BST: Battery Status
   {
    Name (PBST, Package (0x04)
    {
     0x1,  // bitfield, neither charging or not
     0x2328, // do not know battery current at terminals
     0x2328, // hex(int (0x2328 * PERCENT ))  - e.g 0x10e = 3% charge
     0x1500	// voltage at battery in millivolts
    })
    Return (PBST)
   }
  }
 }
}

