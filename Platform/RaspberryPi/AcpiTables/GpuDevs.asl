/** @file
 *
 *  [DSDT] Devices behind the GPU.
 *
 *  Copyright (c) 2018-2020, Andrey Warkentin <andrey.warkentin@gmail.com>
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

// DWC OTG Controller
Device (USB0)
{
  Name (_HID, "BCM2848")
#if (RPI_MODEL == 3)
  Name (_CID, "DWC_OTG")
#elif (RPI_MODEL == 4)
  Name (_CID, "BCM2848")
#endif
  Name (_UID, 0x0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_USB_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_USB_INTERRUPT }
  })
  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_USB_OFFSET)
    Return (^RBUF)
  }
}

// Video Core 5 GPU
Device (GPU1)
{
  Name (_HID, "BCMV5000")
  Name (_CID, "BCMV5000")
  Name (_UID, 0x0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  
  Device(HVS0)
  {
    Name (_HID, "BCMV5001")
    Name (_CID, "BCMV5001")
    Name (_UID, 0x0)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe400000, 0x6000, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 129 }
      })
      Return (RBUF)
    }
  }

  Device(HDM0)
  {
    Name (_HID, "BCMV5020")
    Name (_CID, "BCMV5020")
    Name (_UID, 0x0)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfef00700, 0x300, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 136 }
      })
      Return (RBUF)
    }
  }

  Device(HDM1)
  {
    Name (_HID, "BCMV5021")
    Name (_CID, "BCMV5021")
    Name (_UID, 0x1)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfef05700, 0x300, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 137 }
      })
      Return (RBUF)
    }
  }

  Device(TXP0)
  {
    Name (_HID, "BCMV5003")
    Name (_CID, "BCMV5003")
    Name (_UID, 0x0)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe004000, 0x20, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 107 }
      })
      Return (RBUF)
    }
  }

  Device(PVA0)
  {
    Name (_HID, "BCMV5040")
    Name (_CID, "BCMV5040")
    Name (_UID, 0x0)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe206000, 0x100, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 141 }
      })
      Return (RBUF)
    }
  }


  Device(PVA1)
  {
    Name (_HID, "BCMV5041")
    Name (_CID, "BCMV5041")
    Name (_UID, 0x1)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe207000, 0x100, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 142 }
      })
      Return (RBUF)
    }
  }


  Device(PVA2)
  {
    Name (_HID, "BCMV5042")
    Name (_CID, "BCMV5042")
    Name (_UID, 0x2)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe20a000, 0x100, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 133 }
      })
      Return (RBUF)
    }
  }

  Device(PVA3)
  {
    Name (_HID, "BCMV5043")
    Name (_CID, "BCMV5043")
    Name (_UID, 0x3)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Method (_CRS, 0x0, Serialized)
    {
      Name (RBUF, ResourceTemplate ()
      {
        MEMORY32FIXED (ReadWrite, 0xfe216000, 0x100, )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 138 }
      })
      Return (RBUF)
    }
  }

}

// Video Core 4 GPU
Device (GPU0)
{
  Name (_HID, "BCM2850")
  Name (_CID, "BCM2850")
  Name (_UID, 0x0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    // Memory and interrupt for the GPU
    MEMORY32FIXED (ReadWrite, 0, BCM2836_V3D_BUS_LENGTH, RM01)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_V3D_BUS_INTERRUPT }

    // HVS - Hardware Video Scalar
    MEMORY32FIXED (ReadWrite, 0, BCM2836_HVS_LENGTH, RM02)
    // The HVS interrupt is reserved by the VPU
    // Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_HVS_INTERRUPT }

    // PixelValve0 - DSI0 or DPI
    // MEMORY32FIXED (ReadWrite, BCM2836_PV0_BASE_ADDRESS, BCM2836_PV0_LENGTH, RM03)
    // Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_PV0_INTERRUPT }

    // PixelValve1 - DS1 or SMI
    // MEMORY32FIXED (ReadWrite, BCM2836_PV1_BASE_ADDRESS, BCM2836_PV1_LENGTH, RM04)
    // Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_PV1_INTERRUPT }

    // PixelValve2 - HDMI output - connected to HVS display FIFO 1
    MEMORY32FIXED (ReadWrite, 0, BCM2836_PV2_LENGTH, RM05)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_PV2_INTERRUPT }

    // HDMI registers
    MEMORY32FIXED (ReadWrite, 0, BCM2836_HDMI0_LENGTH, RM06)
    MEMORY32FIXED (ReadWrite, 0, BCM2836_HDMI1_LENGTH, RM07)
    // hdmi_int[0]
    // Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_HDMI0_INTERRUPT }
    // hdmi_int[1]
    // Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_HDMI1_INTERRUPT }

    // HDMI DDC connection
    I2CSerialBus (0x50,, 100000,, "\\_SB.GDV0.I2C2",,,,)  // EDID
    I2CSerialBus (0x30,, 100000,, "\\_SB.GDV0.I2C2",,,,)  // E-DDC Segment Pointer
  })
  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RM01, RB01, BCM2836_V3D_BUS_OFFSET)
    MEMORY32SETBASE (RBUF, RM02, RB02, BCM2836_HVS_OFFSET)
    MEMORY32SETBASE (RBUF, RM05, RB05, BCM2836_PV2_OFFSET)
    MEMORY32SETBASE (RBUF, RM06, RB06, BCM2836_HDMI0_OFFSET)
    MEMORY32SETBASE (RBUF, RM07, RB07, BCM2836_HDMI1_OFFSET)
    Return (^RBUF)
  }

  // GPU Power Management Component Data
  // Reference : https://github.com/Microsoft/graphics-driver-samples/wiki/Install-Driver-in-a-Windows-VM
  Method (PMCD, 0, Serialized)
  {
    Name (RBUF, Package ()
    {
      1,                  // Version
      1,                  // Number of graphics power components
      Package ()          // Power components package
      {
        Package ()        // GPU component package
        {
          0,              // Component Index
          0,              // DXGK_POWER_COMPONENT_MAPPING.ComponentType (0 = DXGK_POWER_COMPONENT_ENGINE)
          0,              // DXGK_POWER_COMPONENT_MAPPING.NodeIndex

          Buffer ()       // DXGK_POWER_RUNTIME_COMPONENT.ComponentGuid
          {               // 9B2D1E26-1575-4747-8FC0-B9EB4BAA2D2B
            0x26, 0x1E, 0x2D, 0x9B, 0x75, 0x15, 0x47, 0x47,
            0x8f, 0xc0, 0xb9, 0xeb, 0x4b, 0xaa, 0x2d, 0x2b
          },

          "VC4_Engine_00",// DXGK_POWER_RUNTIME_COMPONENT.ComponentName
          2,              // DXGK_POWER_RUNTIME_COMPONENT.StateCount

          Package ()      // DXGK_POWER_RUNTIME_COMPONENT.States[] package
          {
            Package ()   // F0
            {
              0,         // DXGK_POWER_RUNTIME_STATE.TransitionLatency
              0,         // DXGK_POWER_RUNTIME_STATE.ResidencyRequirement
              1210000,   // DXGK_POWER_RUNTIME_STATE.NominalPower (microwatt)
            },

            Package ()   // F1 - Placeholder
            {
              10000,     // DXGK_POWER_RUNTIME_STATE.TransitionLatency
              10000,     // DXGK_POWER_RUNTIME_STATE.ResidencyRequirement
              4,         // DXGK_POWER_RUNTIME_STATE.NominalPower
            },
          }
        }
      }
    })
    Return (RBUF)
  }
}

// PiQ Mailbox Driver
Device (RPIQ)
{
  Name (_HID, "BCM2849")
  Name (_CID, "BCM2849")
  Name (_UID, 0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_MBOX_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_MBOX_INTERRUPT }
  })

  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_MBOX_OFFSET)
    Return (^RBUF)
  }
}

// VCHIQ Driver
Device (VCIQ)
{
  Name (_HID, "BCM2835")
  Name (_CID, "BCM2835")
  Name (_UID, 0)
  Name (_CCA, 0x0)
  Name (_DEP, Package() { \_SB.GDV0.RPIQ })
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_VCHIQ_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { BCM2836_VCHIQ_INTERRUPT }
  })

  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_VCHIQ_OFFSET)
    Return (^RBUF)
  }
}

// VC Shared Memory Driver
Device (VCSM)
{
  Name (_HID, "BCM2856")
  Name (_CID, "BCM2856")
  Name (_UID, 0)
  Name (_CCA, 0x0)
  Name (_DEP, Package() { \_SB.GDV0.VCIQ })
  Method (_STA)
  {
    Return (0xf)
  }
}

// Description: GPIO
Device (GPI0)
{
  Name (_HID, "BCM2845")
  Name (_CID, "BCM2845")
  Name (_UID, 0x0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return(0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, GPIO_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared)
    {
      BCM2386_GPIO_INTERRUPT0, BCM2386_GPIO_INTERRUPT1,
      BCM2386_GPIO_INTERRUPT2, BCM2386_GPIO_INTERRUPT3
    }
  })
  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, GPIO_OFFSET)
    Return (^RBUF)
  }
}

// Description: I2C
Device (I2C1)
{
  Name (_HID, "BCM2841")
  Name (_CID, "BCM2841")
  Name (_UID, 0x1)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return(0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_I2C1_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared) { BCM2836_I2C1_INTERRUPT }
    PinFunction (Exclusive, PullUp, BCM_ALT0, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 2, 3 }
  })
  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_I2C1_OFFSET)
    Return (^RBUF)
  }
}

// I2C2 is the HDMI DDC connection
Device (I2C2)
{
  Name (_HID, "BCM2841")
  Name (_CID, "BCM2841")
  Name (_UID, 0x2)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_I2C2_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared) { BCM2836_I2C2_INTERRUPT }
  })

  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_I2C2_OFFSET)
    Return (^RBUF)
  }
}

// SPI
Device (SPI0)
{
  Name (_HID, "BCM2838")
  Name (_CID, "BCM2838")
  Name (_UID, 0x0)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_SPI0_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared) { BCM2836_SPI0_INTERRUPT }
    PinFunction (Exclusive, PullDown, BCM_ALT0, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 9, 10, 11 } // MISO, MOSI, SCLK
    PinFunction (Exclusive, PullUp, BCM_ALT0, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 8 } // CE0
    PinFunction (Exclusive, PullUp, BCM_ALT0, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 7 } // CE1
  })

  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_SPI0_OFFSET)
    Return (^RBUF)
  }
}

Device (SPI1)
{
  Name (_HID, "BCM2839")
  Name (_CID, "BCM2839")
  Name (_UID, 0x1)
  Name (_CCA, 0x0)
  Name (_DEP, Package() { \_SB.GDV0.RPIQ })
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    MEMORY32FIXED (ReadWrite, 0, BCM2836_SPI1_LENGTH, RMEM)
    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared,) { BCM2836_SPI1_INTERRUPT }
    PinFunction (Exclusive, PullDown, BCM_ALT4, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 19, 20, 21 } // MISO, MOSI, SCLK
    PinFunction (Exclusive, PullDown, BCM_ALT4, "\\_SB.GDV0.GPI0", 0, ResourceConsumer, , ) { 16 } // CE2
  })

  Method (_CRS, 0x0, Serialized)
  {
    MEMORY32SETBASE (RBUF, RMEM, RBAS, BCM2836_SPI1_OFFSET)
    Return (^RBUF)
  }
}

// SPI2 has no pins on GPIO header
// Device (SPI2)
// {
//   Name (_HID, "BCM2839")
//   Name (_CID, "BCM2839")
//   Name (_UID, 0x2)
//   Name (_CCA, 0x0)
//   Name (_DEP, Package() { \_SB.GDV0.RPIQ })
//   Method (_STA)
//   {
//     Return (0xf)     // Disabled
//   }
//   Method (_CRS, 0x0, Serialized)
//   {
//     Name (RBUF, ResourceTemplate ()
//     {
//       MEMORY32FIXED (ReadWrite, BCM2836_SPI2_BASE_ADDRESS, BCM2836_SPI2_LENGTH, RMEM)
//       Interrupt (ResourceConsumer, Level, ActiveHigh, Shared,) { BCM2836_SPI2_INTERRUPT }
//     })
//     Return (RBUF)
//   }
// }

// PWM Driver

Device (PWM1)
{
  Name (_HID, "BCM2844")
  Name (_CID, "BCM2844")
  Name (_UID, 1)
  Name (_CCA, 0x0)
  Method (_STA)
  {
    Return (0xf)
  }
  Name (RBUF, ResourceTemplate ()
  {
    // DMA channel 11 control
    MEMORY32FIXED (ReadWrite, 0, 0x00000100, RM01)
    // PWM control
    MEMORY32FIXED (ReadWrite, 0, 0x00000028, RM02)
    // PWM control bus
    MEMORY32FIXED (ReadWrite, 0, 0x00000028, RM03)
    // PWM control uncached
    MEMORY32FIXED (ReadWrite, 0xC0000000, 1 )
     // PWM clock control
     MEMORY32FIXED (ReadWrite, 0, 0x00000008, RM04)
     // Interrupt DMA channel 11
    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x70 }
     // DMA channel 11, DREQ 5 for PWM
    FixedDMA (1, 0, Width32Bit, )
   })
 
   Method (_CRS, 0x0, Serialized)
   {
    MEMORY32SETBASE (RBUF, RM01, RB01, 0x00007000)
    MEMORY32SETBASE (RBUF, RM02, RB02, 0x0020C800)
    MEMORY32SET (RBUF, RM03, RB03, BCM2836_PWM1_CTRL_BUS_BASE_ADDRESS)
    MEMORY32SETBASE (RBUF, RM04, RB04, 0x001010A0)
    Return (^RBUF)
  }
  }
  
Device (SSDE)  // signing policy helper
        {
            Name (_HID, "SSDE000")
        }

Device (SCP4) // second screen pi 4 helper
        {
            Name (_HID, "SCP4000")
        }

 Device (AAUD)
            {
                Name (_HID, "RPI73EA")  // _HID: Hardware ID
                Name (_DEP, Package (0x01)  // _DEP: Dependencies
                {
                    PWM1
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                    Package (0x03)
                    {
                        Package (0x02)
                        {
                            "pwm-clock-source", 
                            "plld"
                        }, 

                        Package (0x02)
                        {
                            "pwm-clock-source-frequency", 
                            0x2CB41780
                        }, 

                        Package (0x02)
                        {
                            "pwm-clock-max-frequency", 
                            0x165A0BC0
                        }
                    }
                })
            }

            Device (HDMI)
            {
                Name (_HID, "RPI73EB")  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000100,         // Address Length
                        _Y28)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000075,
                    }
                    FixedDMA (0x000A, 0x0005, Width32bit, )
                })
                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (RBUF, \_SB.GDV0.HDMI._Y28._BAS, RB01)  // _BAS: Base Address
                    RB01 = 0xFE007500
                    Return (RBUF) /* \_SB_.GDV0.HDMI.RBUF */
                }
            }

            Device (HAUD)
            {
                Name (_HID, "RPI73EC")  // _HID: Hardware ID
                Name (_DEP, Package (0x01)  // _DEP: Dependencies
                {
                    HDMI
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }


include ("Uart.asl")
include ("Rhpx.asl")
include ("Sdhc.asl")
