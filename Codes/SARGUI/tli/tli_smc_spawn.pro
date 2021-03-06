;
;
PRO TLI_SMC_SPAWN, scr, info=info,supress=supress
  COMMON TLI_SMC_GUI, types, file, wid, config, finfo
  
  TLI_SMC_PROGRESS, message=info
  TLI_SMC_PROGRESS,percent=0
  TLI_SMC_PROGRESS,percent=10
  
  SPAWN, scr, result
  
  TLI_SMC_PROGRESS, percent=100
  
  TLI_SMC_PROGRESS,/destroy
  
  TLI_SMC_REPORT, result
  
  temp=STRPOS(STRJOIN(result), 'ERROR:')
  IF temp[0] NE -1 THEN BEGIN
    info= ['ERROR! Please check the information in command line.',$
    '',$
    tli_egg(),$
    '',$
    ' InSAR Tools Using GAMMA Software ', $
    ' For development users only.',$
    ' R&D Dept., Sasmac']
    void=DIALOG_MESSAGE(info,DIALOG_PARENT=wid.base,TITLE='Exit Samsmac InSAR', /CENTER)
    RETURN
  ENDIF
  
  IF NOT KEYWORD_SET(supress) THEN BEGIN
  info= ['Scripts were finished successfully!',$
    '',$
    tli_egg(),$
    '',$
    ' InSAR Tools Using GAMMA Software ', $
    ' For development users only.',$
    ' R&D Dept., Sasmac']
  void=DIALOG_MESSAGE(info, DIALOG_PARENT = wid.base,TITLE='Finished.',/INFORMATION,/CENTER)
  ENDIF
  
  
END