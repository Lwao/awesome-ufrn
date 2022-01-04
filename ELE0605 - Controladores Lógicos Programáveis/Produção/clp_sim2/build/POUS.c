void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->ADD10_OUT,0,retain)
  __INIT_VAR(data__->EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEL15_OUT,0,retain)
  __INIT_VAR(data__->AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->ADD10_OUT,)));
  __SET_VAR(data__->,SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (UINT)__GET_VAR(data__->ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->SEL15_OUT,));
  __SET_VAR(data__->,AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void SIM1_init__(SIM1 *data__, BOOL retain) {
  __INIT_VAR(data__->LIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DES,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RES,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_C,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->S_A,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->I,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->V_PR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->V_PL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->A_FC,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AUX,__BOOL_LITERAL(FALSE),retain)
  UINT i;
  data__->__nb_steps = 8;
  static const STEP temp_step = {{0, 0}, 0, {{0, 0}, 0}};
  for(i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i] = temp_step;
  }
  __SET_VAR(data__->,__step_list[0].X,,1);
  data__->__nb_actions = 6;
  static const ACTION temp_action = {0, {0, 0}, 0, 0, {0, 0}, {0, 0}};
  for(i = 0; i < data__->__nb_actions; i++) {
    data__->__action_list[i] = temp_action;
  }
  data__->__nb_transitions = 9;
  data__->__lasttick_time = __CURRENT_TIME;
}

// Steps definitions
#define E0 __step_list[0]
#define __SFC_E0 0
#define E1 __step_list[1]
#define __SFC_E1 1
#define E2 __step_list[2]
#define __SFC_E2 2
#define E3 __step_list[3]
#define __SFC_E3 3
#define E4 __step_list[4]
#define __SFC_E4 4
#define E6 __step_list[5]
#define __SFC_E6 5
#define E7 __step_list[6]
#define __SFC_E7 6
#define E5 __step_list[7]
#define __SFC_E5 7

// Actions definitions
#define __SFC_M 0
#define __SFC_AUX 1
#define __SFC_I 2
#define __SFC_V_PL 3
#define __SFC_V_PR 4
#define __SFC_A_FC 5

// Code part
void SIM1_body__(SIM1 *data__) {
  // Initialise TEMP variables

  INT i;
  TIME elapsed_time, current_time;

  // Calculate elapsed_time
  current_time = __CURRENT_TIME;
  elapsed_time = __time_sub(current_time, data__->__lasttick_time);
  data__->__lasttick_time = current_time;
  // Transitions initialization
  if (__DEBUG) {
    for (i = 0; i < data__->__nb_transitions; i++) {
      data__->__transition_list[i] = data__->__debug_transition_list[i];
    }
  }
  // Steps initialization
  for (i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i].prev_state = __GET_VAR(data__->__step_list[i].X);
    if (__GET_VAR(data__->__step_list[i].X)) {
      data__->__step_list[i].T.value = __time_add(data__->__step_list[i].T.value, elapsed_time);
    }
  }
  // Actions initialization
  for (i = 0; i < data__->__nb_actions; i++) {
    __SET_VAR(data__->,__action_list[i].state,,0);
    data__->__action_list[i].set = 0;
    data__->__action_list[i].reset = 0;
    if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].set_remaining_time = __time_sub(data__->__action_list[i].set_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].set = 1;
      }
    }
    if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].reset_remaining_time = __time_sub(data__->__action_list[i].reset_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].reset = 1;
      }
    }
  }

  // Transitions fire test
  if (__GET_VAR(data__->E0.X)) {
    __SET_VAR(data__->,__transition_list[0],,(__GET_VAR(data__->LIG,) && !(__GET_VAR(data__->S_C,))));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,__GET_VAR(data__->__transition_list[0]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,(__GET_VAR(data__->LIG,) && !(__GET_VAR(data__->S_C,))));
    }
    __SET_VAR(data__->,__transition_list[0],,0);
  }
  if (__GET_VAR(data__->E1.X)) {
    __SET_VAR(data__->,__transition_list[1],,__GET_VAR(data__->S_A,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,__GET_VAR(data__->__transition_list[1]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,__GET_VAR(data__->S_A,));
    }
    __SET_VAR(data__->,__transition_list[1],,0);
  }
  if (__GET_VAR(data__->E2.X)) {
    __SET_VAR(data__->,__transition_list[2],,__GET_VAR(data__->AUX,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->__transition_list[2]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->AUX,));
    }
    __SET_VAR(data__->,__transition_list[2],,0);
  }
  if (__GET_VAR(data__->E3.X)) {
    __SET_VAR(data__->,__transition_list[3],,__GET_VAR(data__->S_C,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->__transition_list[3]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->S_C,));
    }
    __SET_VAR(data__->,__transition_list[3],,0);
  }
  if (__GET_VAR(data__->E4.X)) {
    __SET_VAR(data__->,__transition_list[4],,__GET_VAR(data__->DES,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[4],,__GET_VAR(data__->__transition_list[4]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[4],,__GET_VAR(data__->DES,));
    }
    __SET_VAR(data__->,__transition_list[4],,0);
  }
  if (__GET_VAR(data__->E6.X)) {
    __SET_VAR(data__->,__transition_list[5],,__GET_VAR(data__->AUX,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[5],,__GET_VAR(data__->__transition_list[5]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[5],,__GET_VAR(data__->AUX,));
    }
    __SET_VAR(data__->,__transition_list[5],,0);
  }
  if (__GET_VAR(data__->E7.X)) {
    __SET_VAR(data__->,__transition_list[6],,!(__GET_VAR(data__->M,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[6],,__GET_VAR(data__->__transition_list[6]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[6],,!(__GET_VAR(data__->M,)));
    }
    __SET_VAR(data__->,__transition_list[6],,0);
  }
  if (__GET_VAR(data__->E4.X)) {
    __SET_VAR(data__->,__transition_list[7],,(!(__GET_VAR(data__->S_C,)) && !(__GET_VAR(data__->DES,))));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[7],,__GET_VAR(data__->__transition_list[7]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[7],,(!(__GET_VAR(data__->S_C,)) && !(__GET_VAR(data__->DES,))));
    }
    __SET_VAR(data__->,__transition_list[7],,0);
  }
  if (__GET_VAR(data__->E5.X)) {
    __SET_VAR(data__->,__transition_list[8],,__GET_VAR(data__->RES,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[8],,__GET_VAR(data__->__transition_list[8]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[8],,__GET_VAR(data__->RES,));
    }
    __SET_VAR(data__->,__transition_list[8],,0);
  }

  // Transitions reset steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,E0.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,E1.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,E2.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,E3.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[4])) {
    __SET_VAR(data__->,E4.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[5])) {
    __SET_VAR(data__->,E6.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[6])) {
    __SET_VAR(data__->,E7.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[7])) {
    __SET_VAR(data__->,E4.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[8])) {
    __SET_VAR(data__->,E5.X,,0);
  }

  // Transitions set steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,E1.X,,1);
    data__->E1.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,E2.X,,1);
    data__->E2.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,E3.X,,1);
    data__->E3.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,E4.X,,1);
    data__->E4.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[4])) {
    __SET_VAR(data__->,E6.X,,1);
    data__->E6.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[5])) {
    __SET_VAR(data__->,E7.X,,1);
    data__->E7.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[6])) {
    __SET_VAR(data__->,E0.X,,1);
    data__->E0.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[7])) {
    __SET_VAR(data__->,E5.X,,1);
    data__->E5.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[8])) {
    __SET_VAR(data__->,E6.X,,1);
    data__->E6.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }

  // Steps association
  // E1 action associations
  {
    char active = __GET_VAR(data__->E1.X);
    char activated = active && !data__->E1.prev_state;
    char desactivated = !active && data__->E1.prev_state;

    if (active)       {data__->__action_list[__SFC_M].set = 1;}

  }

  // E2 action associations
  {
    char active = __GET_VAR(data__->E2.X);
    char activated = active && !data__->E2.prev_state;
    char desactivated = !active && data__->E2.prev_state;

    if (active && __time_cmp(data__->E2.T.value, __time_to_timespec(1, 0, 10, 0, 0, 0)) >= 0) 
                      {__SET_VAR(data__->,AUX,,1);}
    else if (desactivated)
                      {__SET_VAR(data__->,AUX,,0);};

  }

  // E3 action associations
  {
    char active = __GET_VAR(data__->E3.X);
    char activated = active && !data__->E3.prev_state;
    char desactivated = !active && data__->E3.prev_state;

    if (active && __time_cmp(data__->E3.T.value, __time_to_timespec(1, 0, 2, 0, 0, 0)) < 0) 
                      {__SET_VAR(data__->,I,,1);}
    else if (desactivated || active)
                      {__SET_VAR(data__->,I,,0);};

    if (active && __time_cmp(data__->E3.T.value, __time_to_timespec(1, 0, 2, 0, 0, 0)) < 0) 
                      {__SET_VAR(data__->,V_PL,,1);}
    else if (desactivated || active)
                      {__SET_VAR(data__->,V_PL,,0);};

  }

  // E4 action associations
  {
    char active = __GET_VAR(data__->E4.X);
    char activated = active && !data__->E4.prev_state;
    char desactivated = !active && data__->E4.prev_state;

    if (active)       {__SET_VAR(data__->,V_PR,,1);};
    if (desactivated) {__SET_VAR(data__->,V_PR,,0);};

  }

  // E6 action associations
  {
    char active = __GET_VAR(data__->E6.X);
    char activated = active && !data__->E6.prev_state;
    char desactivated = !active && data__->E6.prev_state;

    if (active && __time_cmp(data__->E6.T.value, __time_to_timespec(1, 0, 30, 0, 0, 0)) >= 0) 
                      {__SET_VAR(data__->,AUX,,1);}
    else if (desactivated)
                      {__SET_VAR(data__->,AUX,,0);};

  }

  // E7 action associations
  {
    char active = __GET_VAR(data__->E7.X);
    char activated = active && !data__->E7.prev_state;
    char desactivated = !active && data__->E7.prev_state;

    if (active)       {data__->__action_list[__SFC_M].reset = 1;}

  }

  // E5 action associations
  {
    char active = __GET_VAR(data__->E5.X);
    char activated = active && !data__->E5.prev_state;
    char desactivated = !active && data__->E5.prev_state;

    if (active)       {__SET_VAR(data__->,A_FC,,1);};
    if (desactivated) {__SET_VAR(data__->,A_FC,,0);};

  }


  // Actions state evaluation
  for (i = 0; i < data__->__nb_actions; i++) {
    if (data__->__action_list[i].set) {
      data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 1;
    }
    if (data__->__action_list[i].reset) {
      data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 0;
    }
    __SET_VAR(data__->,__action_list[i].state,,__GET_VAR(data__->__action_list[i].state) | data__->__action_list[i].stored);
  }

  // Actions execution
  if (data__->__action_list[__SFC_M].reset) {
    __SET_VAR(data__->,M,,0);
  }
  else if (data__->__action_list[__SFC_M].set) {
    __SET_VAR(data__->,M,,1);
  }
  if (data__->__action_list[__SFC_AUX].reset) {
    __SET_VAR(data__->,AUX,,0);
  }
  else if (data__->__action_list[__SFC_AUX].set) {
    __SET_VAR(data__->,AUX,,1);
  }
  if (data__->__action_list[__SFC_I].reset) {
    __SET_VAR(data__->,I,,0);
  }
  else if (data__->__action_list[__SFC_I].set) {
    __SET_VAR(data__->,I,,1);
  }
  if (data__->__action_list[__SFC_V_PL].reset) {
    __SET_VAR(data__->,V_PL,,0);
  }
  else if (data__->__action_list[__SFC_V_PL].set) {
    __SET_VAR(data__->,V_PL,,1);
  }
  if (data__->__action_list[__SFC_V_PR].reset) {
    __SET_VAR(data__->,V_PR,,0);
  }
  else if (data__->__action_list[__SFC_V_PR].set) {
    __SET_VAR(data__->,V_PR,,1);
  }
  if (data__->__action_list[__SFC_A_FC].reset) {
    __SET_VAR(data__->,A_FC,,0);
  }
  else if (data__->__action_list[__SFC_A_FC].set) {
    __SET_VAR(data__->,A_FC,,1);
  }


  goto __end;

__end:
  return;
} // SIM1_body__() 

// Steps undefinitions
#undef E0
#undef __SFC_E0
#undef E1
#undef __SFC_E1
#undef E2
#undef __SFC_E2
#undef E3
#undef __SFC_E3
#undef E4
#undef __SFC_E4
#undef E6
#undef __SFC_E6
#undef E7
#undef __SFC_E7
#undef E5
#undef __SFC_E5

// Actions undefinitions
#undef __SFC_M
#undef __SFC_AUX
#undef __SFC_I
#undef __SFC_V_PL
#undef __SFC_V_PR
#undef __SFC_A_FC





