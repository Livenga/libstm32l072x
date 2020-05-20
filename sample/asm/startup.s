.file "startup.s"
.cpu cortex-m0plus
.fpu softvfp
.thumb
.text


.global reset_handler
.global isr_vector


reset_handler:
  bl __arm_init
  bl main
  nop


default_handler:
inf_loop:
  bl inf_loop



.section .isr_vector, "a", %progbits
.type isr_vector, %object
.size isr_vector, .-isr_vector

isr_vector:
  .word estack // Reserved, -, 0x00000000
  .word reset_handler // Reset, -3, 0x00000004
  .word NMI_handler // NMI, -2, 0x00000008
  .word HardFault_handler // HardFault, -1, 0x0000000C
  .word 0 // Reserved, 0x00000010
  .word 0 // Reserved, 0x00000014
  .word 0 // Reserved, 0x00000018
  .word 0 // Reserved, 0x0000001C
  .word 0 // Reserved, 0x00000020
  .word 0 // Reserved, 0x00000024
  .word 0 // Reserved, 0x00000028
  .word SVC_handler // SVC, 3, 0x0000002C
  .word 0 // Reserved, 0x00000030
  .word 0 // Reserved, 0x00000034
  .word PendSV_handler // PendSV, 5, 0x00000038
  .word SysTick_handler // SysTick, 6, 0x0000003C
  .word WWDG_handler // WWDG, 7, 0x00000040
  .word PVD_handler
  .word RTC_handler
  .word FLASH_handler
  .word RCC_CRS_handler
  .word EXTI1_0_handler
  .word EXTI3_2_handler
  .word EXTI15_4_handler
  .word TSC_handler
  .word DMA1_CHANNEL1_handler
  .word DMA1_CHANNEL3_2_handler
  .word DMA1_CHANNEL7_4_handler
  .word ADC_COMP_handler
  .word LPTIM1_handler
  .word USART4_5_handler
  .word TIM2_handler
  .word TIM3_handler
  .word TIM6_DAC_handler
  .word TIM7_handler
  .word 0
  .word TIM21_handler
  .word I2C3_handler
  .word TIM22_handler
  .word I2C1_handler
  .word I2C2_handler
  .word SPI1_handler
  .word SPI2_handler
  .word USART1_handler
  .word USART2_handler
  .word LPUSART1_AED_RNG_handler
  .word 0
  .word USB_handler


.weak NMI_handler
.thumb_set NMI_handler, default_handler

.weak HardFault_handler
.thumb_set HardFault_handler, default_handler

.weak SVC_handler
.thumb_set SVC_handler, default_handler

.weak PendSV_handler
.thumb_set PendSV_handler, default_handler

.weak SysTick_handler
.thumb_set SysTick_handler, default_handler

.weak WWDG_handler
.thumb_set WWDG_handler, default_handler

.weak PVD_handler
.thumb_set PVD_handler, default_handler

.weak RTC_handler
.thumb_set RTC_handler, default_handler

.weak FLASH_handler
.thumb_set FLASH_handler, default_handler

.weak RCC_CRS_handler
.thumb_set RCC_CRS_handler, default_handler

.weak EXTI1_0_handler
.thumb_set EXTI1_0_handler, default_handler

.weak EXTI3_2_handler
.thumb_set EXTI3_2_handler, default_handler

.weak EXTI15_4_handler
.thumb_set EXTI15_4_handler, default_handler

.weak TSC_handler
.thumb_set TSC_handler, default_handler

.weak DMA1_CHANNEL1_handler
.thumb_set DMA1_CHANNEL1_handler, default_handler

.weak DMA1_CHANNEL3_2_handler
.thumb_set DMA1_CHANNEL_3_2_handler, default_handler

.weak DMA1_CHANNEL7_4_handler
.thumb_set DMA1_CHANNEL_7_4_handler, default_handler

.weak ADC_COMP_handler
.thumb_set ADC_COMP_handler, default_handler

.weak LPTIM1_handler
.thumb_set LPTIM1_handler, default_handler

.weak USART4_5_handler
.thumb_set USART4_5_handler, default_handler

.weak TIM2_handler
.thumb_set TIM2_handler, default_handler

.weak TIM3_handler
.thumb_set TIM3_handler, default_handler

.weak TIM6_DAC_handler
.thumb_set TIM6_DAC_handler, default_handler

.weak TIM7_handler
.thumb_set TIM7_handler, default_handler

.weak TIM21_handler
.thumb_set TIM21_handler, default_handler

.weak I2C3_handler
.thumb_set I2C3_handler, default_handler

.weak TIM22_handler
.thumb_set TIM22_handler, default_handler

.weak I2C1_handler
.thumb_set I2C1_handler, default_handler

.weak I2C2_handler
.thumb_set I2C2_handler, default_handler

.weak SPI1_handler
.thumb_set SPI1_handler, default_handler

.weak SPI2_handler
.thumb_set SPI2_handler, default_handler

.weak USART1_handler
.thumb_set USART1_handler, default_handler

.weak USART2_handler
.thumb_set USART2_handler, default_handler

.weak LPUSART1_AED_RNG_handler
.thumb_set LPUSART1_AED_RNG_handler, default_handler

.weak USB_handler
.thumb_set USB_handler, default_handler

.end
