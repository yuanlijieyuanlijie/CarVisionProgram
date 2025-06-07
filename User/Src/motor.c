//
// Created by YLJ on 2025/5/27.
//
#include <stdint.h>
#include "main.h"
#include "memory.h"
#include "tim.h"
#include "motor.h"


int motor1_dir = 0;
int motor1_pwm = 0;
int motor2_dir = 0;
int motor2_pwm = 0;

void Motor_Init(void) {
    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_2);
}



//设置电机速度
void Motor_SetSpeed(uint8_t channel,uint16_t duty) {
    if (duty > 1000) duty = 1000;

    if (channel == 1) {
        __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_1, duty);
        motor1_pwm = duty;
    }else if (channel == 2) {
        __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_2, duty);
        motor2_pwm = duty;
    }
}

//设置电机方向（控制电机驱动的IN引脚）
void Motor_SetDirection(uint8_t motor,uint16_t dir) {
    if (motor == 1) {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_2,dir?GPIO_PIN_SET:GPIO_PIN_RESET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_3,dir?GPIO_PIN_RESET:GPIO_PIN_SET);
        motor1_dir = dir;
    }else if (motor == 2) {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,dir?GPIO_PIN_SET:GPIO_PIN_RESET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_5,dir?GPIO_PIN_RESET:GPIO_PIN_SET);
        motor2_dir = dir;
    }
}
