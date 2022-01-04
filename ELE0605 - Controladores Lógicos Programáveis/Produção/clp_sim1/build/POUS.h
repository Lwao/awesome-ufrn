#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// FUNCTION_BLOCK LOGGER
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,MSG)
  __DECLARE_VAR(LOGLEVEL,LEVEL)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,TRIG0)

} LOGGER;

void LOGGER_init__(LOGGER *data__, BOOL retain);
// Code part
void LOGGER_body__(LOGGER *data__);
// FUNCTION_BLOCK PYTHON_EVAL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_EVAL;

void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain);
// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__);
// FUNCTION_BLOCK PYTHON_POLL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_POLL;

void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain);
// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__);
// FUNCTION_BLOCK PYTHON_GEAR
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(UINT,N)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  PYTHON_EVAL PY_EVAL;
  __DECLARE_VAR(UINT,COUNTER)
  __DECLARE_VAR(UINT,ADD10_OUT)
  __DECLARE_VAR(BOOL,EQ13_OUT)
  __DECLARE_VAR(UINT,SEL15_OUT)
  __DECLARE_VAR(BOOL,AND7_OUT)

} PYTHON_GEAR;

void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain);
// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__);
// PROGRAM SIM2
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,LIG)
  __DECLARE_VAR(BOOL,DES)
  __DECLARE_VAR(BOOL,S_C)
  __DECLARE_VAR(BOOL,S_A)
  __DECLARE_VAR(BOOL,M)
  __DECLARE_VAR(BOOL,I)
  __DECLARE_VAR(BOOL,V_PR)
  __DECLARE_VAR(BOOL,V_PL)
  __DECLARE_VAR(BOOL,AUX)

  // PROGRAM private variables - TEMP, private and located variables
  STEP __step_list[4];
  UINT __nb_steps;
  ACTION __action_list[4];
  UINT __nb_actions;
  __IEC_BOOL_t __transition_list[4];
  __IEC_BOOL_t __debug_transition_list[4];
  UINT __nb_transitions;
  TIME __lasttick_time;

} SIM2;

void SIM2_init__(SIM2 *data__, BOOL retain);
// Code part
void SIM2_body__(SIM2 *data__);
// PROGRAM SIM1
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,S_L)
  __DECLARE_VAR(BOOL,S_H)
  __DECLARE_VAR(BOOL,V_A)
  __DECLARE_VAR(BOOL,V_B)
  __DECLARE_VAR(BOOL,V_C)
  __DECLARE_VAR(BOOL,V_D)
  __DECLARE_VAR(BOOL,V_S)
  __DECLARE_VAR(BOOL,B)
  __DECLARE_VAR(BOOL,A)

  // PROGRAM private variables - TEMP, private and located variables
  STEP __step_list[6];
  UINT __nb_steps;
  ACTION __action_list[7];
  UINT __nb_actions;
  __IEC_BOOL_t __transition_list[4];
  __IEC_BOOL_t __debug_transition_list[4];
  UINT __nb_transitions;
  TIME __lasttick_time;

} SIM1;

void SIM1_init__(SIM1 *data__, BOOL retain);
// Code part
void SIM1_body__(SIM1 *data__);
#endif //__POUS_H
