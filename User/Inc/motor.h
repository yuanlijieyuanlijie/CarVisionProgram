//
// Created by YLJ on 2025/5/27.
//

#ifndef MOTOR_H
#define MOTOR_H
#include <stdint.h>

extern int motor1_dir;
extern int motor1_pwm;
extern int motor2_dir;
extern int motor2_pwm;
void Motor_SetSpeed(uint8_t channel,uint16_t duty);
void Motor_SetDirection(uint8_t channel,uint16_t duty);
void Motor_Init(void);

#endif //MOTOR_H
