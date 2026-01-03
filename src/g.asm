//****************************
//  JC64dis version 3.0
//  
//  Source in KickAssembler format
//****************************

      .cpu _6502

.label W07FE = $07FE              

      *=$0428

      slo  ($01),y                      // 6510 I/O register
      asl  $09,x                        // Screen column after last TAB
      asl  W2005+2                      
      anc  #$0A                         // Unusual operation
      php                               
      slo  ($15),y                      // Transient: integer value
      asl  $0B,x                        // Buffer pointer of input/number index
      slo  W1614+1                      
      ora  $07,x                        // Search char
      ora  $0B,x                        // Buffer pointer of input/number index
      ora  $07,x                        // Search char
      anc  #$15                         // Unusual operation
      *=$07FF

      sta  W15FF+1,y                    
      php                               
      asl                               
      brk                               
      shx  W341F+1,y                    
      bmi  $0843                        
      rol  $3A,x                        // BASIC current line number
W080C:
      sax  $4820                        
      sre  $444E                        
      eor  ($4E,x)                      // Scratch area
W0814:
      eor  #$00                         
      brk                               
      *=$1000

      lda  #$00                         
W1002:
      sta  $0318                        // Vector: Not maskerable Interrupt (NMI)
      lda  #$90                         
      sta  $0319                        // Vector: Not maskerable Interrupt (NMI)
      sei                               
      lda  #$7F                         
      sta  $DC0D                        // Interrupt control register CIA #1
      lda  $D011                        // VIC control register
W1013:
      and  #$7F                         
      sta  $D011                        // VIC control register
      lda  #$01                         
      sta  $D01A                        // IRQ mask register
      lda  #$F8                         
      sta  $D012                        // Reading/Writing IRQ balance value
      lda  #$2E                         
      sta  $0314                        // Vector: Hardware Interrupt (IRQ)
      lda  #$10                         
      sta  $0315                        // Vector: Hardware Interrupt (IRQ)
      cli                               
      rts                               

W102E:
      inc  $D019                        // Interrupt indicator register
      lda  #$E2                         
      sta  $0314                        // Vector: Hardware Interrupt (IRQ)
      lda  #$15                         
      sta  $0315                        // Vector: Hardware Interrupt (IRQ)
      lda  #$10                         
      sta  $D011                        // VIC control register
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1048:
      lda  #$01                         
      sta  $3FFF                        
W104D:
      lda  #$02                         
      sta  $3FFF                        
W1052:
      lda  #$03                         
      sta  $3FFF                        
W1057:
      lda  #$04                         
      sta  $3FFF                        
W105C:
      lda  #$05                         
      sta  $3FFF                        
W1061:
      lda  #$06                         
      sta  $3FFF                        
W1066:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1079:
      lda  #$01                         
      sta  $3FFF                        
W107E:
      lda  #$02                         
      sta  $3FFF                        
W1083:
      lda  #$03                         
      sta  $3FFF                        
W1088:
      lda  #$04                         
      sta  $3FFF                        
W108D:
      lda  #$05                         
      sta  $3FFF                        
W1092:
      lda  #$06                         
      sta  $3FFF                        
W1097:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W10AA:
      lda  #$01                         
      sta  $3FFF                        
W10AF:
      lda  #$02                         
      sta  $3FFF                        
W10B4:
      lda  #$03                         
      sta  $3FFF                        
W10B9:
      lda  #$04                         
      sta  $3FFF                        
W10BE:
      lda  #$05                         
      sta  $3FFF                        
W10C3:
      lda  #$06                         
      sta  $3FFF                        
W10C8:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W10DB:
      lda  #$01                         
      sta  $3FFF                        
W10E0:
      lda  #$02                         
      sta  $3FFF                        
W10E5:
      lda  #$03                         
      sta  $3FFF                        
W10EA:
      lda  #$04                         
      sta  $3FFF                        
W10EF:
      lda  #$05                         
      sta  $3FFF                        
W10F4:
      lda  #$06                         
      sta  $3FFF                        
W10F9:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W110C:
      lda  #$01                         
      sta  $3FFF                        
W1111:
      lda  #$02                         
      sta  $3FFF                        
W1116:
      lda  #$03                         
      sta  $3FFF                        
W111B:
      lda  #$04                         
      sta  $3FFF                        
W1120:
      lda  #$05                         
      sta  $3FFF                        
W1125:
      lda  #$06                         
      sta  $3FFF                        
W112A:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W113D:
      lda  #$01                         
      sta  $3FFF                        
W1142:
      lda  #$02                         
      sta  $3FFF                        
W1147:
      lda  #$03                         
      sta  $3FFF                        
W114C:
      lda  #$04                         
      sta  $3FFF                        
W1151:
      lda  #$05                         
      sta  $3FFF                        
W1156:
      lda  #$06                         
      sta  $3FFF                        
W115B:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W116E:
      lda  #$01                         
      sta  $3FFF                        
W1173:
      lda  #$02                         
      sta  $3FFF                        
W1178:
      lda  #$03                         
      sta  $3FFF                        
W117D:
      lda  #$04                         
      sta  $3FFF                        
W1182:
      lda  #$05                         
      sta  $3FFF                        
W1187:
      lda  #$06                         
      sta  $3FFF                        
W118C:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W119F:
      lda  #$01                         
      sta  $3FFF                        
W11A4:
      lda  #$02                         
      sta  $3FFF                        
W11A9:
      lda  #$03                         
      sta  $3FFF                        
W11AE:
      lda  #$04                         
      sta  $3FFF                        
W11B3:
      lda  #$05                         
      sta  $3FFF                        
W11B8:
      lda  #$06                         
      sta  $3FFF                        
W11BD:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W11D0:
      lda  #$01                         
      sta  $3FFF                        
W11D5:
      lda  #$02                         
      sta  $3FFF                        
W11DA:
      lda  #$03                         
      sta  $3FFF                        
W11DF:
      lda  #$04                         
      sta  $3FFF                        
W11E4:
      lda  #$05                         
      sta  $3FFF                        
W11E9:
      lda  #$06                         
      sta  $3FFF                        
W11EE:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1201:
      lda  #$01                         
      sta  $3FFF                        
W1206:
      lda  #$02                         
      sta  $3FFF                        
W120B:
      lda  #$03                         
      sta  $3FFF                        
W1210:
      lda  #$04                         
W1212:
      sta  $3FFF                        
W1215:
      lda  #$05                         
W1217:
      sta  $3FFF                        
W121A:
      lda  #$06                         
      sta  $3FFF                        
W121F:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W122E:
      bit  $00                          
      bit  $00                          
W1232:
      lda  #$01                         
      sta  $3FFF                        
W1237:
      lda  #$02                         
      sta  $3FFF                        
W123C:
      lda  #$03                         
      sta  $3FFF                        
W1241:
      lda  #$04                         
      sta  $3FFF                        
W1246:
      lda  #$05                         
      sta  $3FFF                        
W124B:
      lda  #$06                         
      sta  $3FFF                        
W1250:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1263:
      lda  #$01                         
      sta  $3FFF                        
W1268:
      lda  #$02                         
      sta  $3FFF                        
W126D:
      lda  #$03                         
      sta  $3FFF                        
W1272:
      lda  #$04                         
      sta  $3FFF                        
W1277:
      lda  #$05                         
      sta  $3FFF                        
W127C:
      lda  #$06                         
      sta  $3FFF                        
W1281:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1294:
      lda  #$01                         
      sta  $3FFF                        
W1299:
      lda  #$02                         
      sta  $3FFF                        
W129E:
      lda  #$03                         
      sta  $3FFF                        
W12A3:
      lda  #$04                         
      sta  $3FFF                        
W12A8:
      lda  #$05                         
      sta  $3FFF                        
W12AD:
      lda  #$06                         
      sta  $3FFF                        
W12B2:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W12C5:
      lda  #$01                         
      sta  $3FFF                        
W12CA:
      lda  #$02                         
      sta  $3FFF                        
W12CF:
      lda  #$03                         
      sta  $3FFF                        
W12D4:
      lda  #$04                         
      sta  $3FFF                        
W12D9:
      lda  #$05                         
      sta  $3FFF                        
W12DE:
      lda  #$06                         
      sta  $3FFF                        
W12E3:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W12F6:
      lda  #$01                         
      sta  $3FFF                        
W12FB:
      lda  #$02                         
      sta  $3FFF                        
W1300:
      lda  #$03                         
      sta  $3FFF                        
W1305:
      lda  #$04                         
W1307:
      sta  $3FFF                        
W130A:
      lda  #$05                         
      sta  $3FFF                        
W130F:
      lda  #$06                         
      sta  $3FFF                        
W1314:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1327:
      lda  #$01                         
      sta  $3FFF                        
W132C:
      lda  #$02                         
      sta  $3FFF                        
W1331:
      lda  #$03                         
      sta  $3FFF                        
W1336:
      lda  #$04                         
      sta  $3FFF                        
W133B:
      lda  #$05                         
      sta  $3FFF                        
W1340:
      lda  #$06                         
      sta  $3FFF                        
W1345:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1358:
      lda  #$01                         
      sta  $3FFF                        
W135D:
      lda  #$02                         
      sta  $3FFF                        
W1362:
      lda  #$03                         
      sta  $3FFF                        
W1367:
      lda  #$04                         
      sta  $3FFF                        
W136C:
      lda  #$05                         
      sta  $3FFF                        
W1371:
      lda  #$06                         
      sta  $3FFF                        
W1376:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1389:
      lda  #$01                         
      sta  $3FFF                        
W138E:
      lda  #$02                         
      sta  $3FFF                        
W1393:
      lda  #$03                         
      sta  $3FFF                        
W1398:
      lda  #$04                         
      sta  $3FFF                        
W139D:
      lda  #$05                         
      sta  $3FFF                        
W13A2:
      lda  #$06                         
      sta  $3FFF                        
W13A7:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W13BA:
      lda  #$01                         
      sta  $3FFF                        
W13BF:
      lda  #$02                         
      sta  $3FFF                        
W13C4:
      lda  #$03                         
      sta  $3FFF                        
W13C9:
      lda  #$04                         
      sta  $3FFF                        
W13CE:
      lda  #$05                         
      sta  $3FFF                        
W13D3:
      lda  #$06                         
      sta  $3FFF                        
W13D8:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W13EB:
      lda  #$01                         
      sta  $3FFF                        
W13F0:
      lda  #$02                         
      sta  $3FFF                        
W13F5:
      lda  #$03                         
      sta  $3FFF                        
W13FA:
      lda  #$04                         
      sta  $3FFF                        
W13FF:
      lda  #$05                         
      sta  $3FFF                        
W1404:
      lda  #$06                         
      sta  $3FFF                        
W1409:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1414:
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W141C:
      lda  #$01                         
      sta  $3FFF                        
W1421:
      lda  #$02                         
      sta  $3FFF                        
W1426:
      lda  #$03                         
      sta  $3FFF                        
W142B:
      lda  #$04                         
W142D:
      sta  $3FFF                        
W1430:
      lda  #$05                         
      sta  $3FFF                        
W1435:
      lda  #$06                         
      sta  $3FFF                        
W143A:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W144D:
      lda  #$01                         
      sta  $3FFF                        
W1452:
      lda  #$02                         
      sta  $3FFF                        
W1457:
      lda  #$03                         
      sta  $3FFF                        
W145C:
      lda  #$04                         
      sta  $3FFF                        
W1461:
      lda  #$05                         
      sta  $3FFF                        
W1466:
      lda  #$06                         
      sta  $3FFF                        
W146B:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W147E:
      lda  #$01                         
      sta  $3FFF                        
W1483:
      lda  #$02                         
      sta  $3FFF                        
W1488:
      lda  #$03                         
      sta  $3FFF                        
W148D:
      lda  #$04                         
      sta  $3FFF                        
W1492:
      lda  #$05                         
      sta  $3FFF                        
W1497:
      lda  #$06                         
      sta  $3FFF                        
W149C:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W14AF:
      lda  #$01                         
      sta  $3FFF                        
W14B4:
      lda  #$02                         
      sta  $3FFF                        
W14B9:
      lda  #$03                         
      sta  $3FFF                        
W14BE:
      lda  #$04                         
      sta  $3FFF                        
W14C3:
      lda  #$05                         
      sta  $3FFF                        
W14C8:
      lda  #$06                         
      sta  $3FFF                        
W14CD:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W14E0:
      lda  #$01                         
      sta  $3FFF                        
W14E5:
      lda  #$02                         
      sta  $3FFF                        
W14EA:
      lda  #$03                         
      sta  $3FFF                        
W14EF:
      lda  #$04                         
      sta  $3FFF                        
W14F4:
      lda  #$05                         
      sta  $3FFF                        
W14F9:
      lda  #$06                         
      sta  $3FFF                        
W14FE:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1509:
      bit  $00                          
      bit  $00                          
      bit  $00                          
W150F:
      bit  $00                          
W1511:
      lda  #$01                         
      sta  $3FFF                        
W1516:
      lda  #$02                         
      sta  $3FFF                        
W151B:
      lda  #$03                         
      sta  $3FFF                        
W1520:
      lda  #$04                         
      sta  $3FFF                        
W1525:
      lda  #$05                         
      sta  $3FFF                        
W152A:
      lda  #$06                         
      sta  $3FFF                        
W152F:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1542:
      lda  #$01                         
      sta  $3FFF                        
W1547:
      lda  #$02                         
      sta  $3FFF                        
W154C:
      lda  #$03                         
      sta  $3FFF                        
W1551:
      lda  #$04                         
      sta  $3FFF                        
W1556:
      lda  #$05                         
      sta  $3FFF                        
W155B:
      lda  #$06                         
      sta  $3FFF                        
W1560:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W1573:
      lda  #$01                         
      sta  $3FFF                        
W1578:
      lda  #$02                         
      sta  $3FFF                        
W157D:
      lda  #$03                         
      sta  $3FFF                        
W1582:
      lda  #$04                         
      sta  $3FFF                        
W1587:
      lda  #$05                         
      sta  $3FFF                        
W158C:
      lda  #$06                         
      sta  $3FFF                        
W1591:
      lda  #$07                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
W15A4:
      lda  #$01                         
      sta  $3FFF                        
W15A9:
      lda  #$02                         
      sta  $3FFF                        
W15AE:
      lda  #$03                         
      sta  $3FFF                        
W15B3:
      lda  #$04                         
      sta  $3FFF                        
W15B8:
      lda  #$05                         
      sta  $3FFF                        
W15BD:
      lda  #$06                         
      sta  $3FFF                        
W15C2:
      lda  #$00                         
      sta  $3FFF                        
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      bit  $00                          
      lda  #$18                         
      sta  $D012                        // Reading/Writing IRQ balance value
      lda  #$00                         
      sta  $3FFF                        
      jmp  $EA81                        

      lda  $D019                        // Interrupt indicator register
      sta  $D019                        // Interrupt indicator register
      lda  #$46                         
      sta  $D012                        // Reading/Writing IRQ balance value
      lda  #$B4                         
      sta  $0314                        // Vector: Hardware Interrupt (IRQ)
      lda  #$1B                         
      sta  $0315                        // Vector: Hardware Interrupt (IRQ)
      lda  #$18                         
      sta  $D011                        // VIC control register
      lda  W1079+1                      
W15FF:
      sta  W1048+1                      
      lda  W10AA+1                      
      sta  W1079+1                      
      lda  W10DB+1                      
      sta  W10AA+1                      
W160E:
      lda  W110C+1                      
      sta  W10DB+1                      
W1614:
      lda  W113D+1                      
      sta  W110C+1                      
      lda  W116E+1                      
      sta  W113D+1                      
      lda  W119F+1                      
      sta  W116E+1                      
      lda  W11D0+1                      
      sta  W119F+1                      
      lda  W1201+1                      
      sta  W11D0+1                      
      lda  W1232+1                      
      sta  W1201+1                      
      lda  W1263+1                      
      sta  W1232+1                      
      lda  W1294+1                      
      sta  W1263+1                      
      lda  W12C5+1                      
      sta  W1294+1                      
      lda  W12F6+1                      
      sta  W12C5+1                      
      lda  W1327+1                      
      sta  W12F6+1                      
      lda  W1358+1                      
      sta  W1327+1                      
      lda  W1389+1                      
      sta  W1358+1                      
      lda  W13BA+1                      
      sta  W1389+1                      
      lda  W13EB+1                      
      sta  W13BA+1                      
      lda  W141C+1                      
      sta  W13EB+1                      
      lda  W144D+1                      
      sta  W141C+1                      
      lda  W147E+1                      
      sta  W144D+1                      
      lda  W14AF+1                      
      sta  W147E+1                      
      lda  W14E0+1                      
      sta  W14AF+1                      
      lda  W1511+1                      
      sta  W14E0+1                      
      lda  W1542+1                      
      sta  W1511+1                      
      lda  W1573+1                      
      sta  W1542+1                      
      lda  W15A4+1                      
      sta  W1573+1                      
      ldx  W1BA4                        
      lda  W3000,x                      
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BA5                        
      inc  W1BA5                        
      tax                               
      lda  W2000,x                      
      sta  W15A4+1                      
      ldx  W1BA5                        
      cpx  #$07                         
      bne  W16CA                        
      lda  #$00                         
      sta  W1BA5                        
      inc  W1BA4                        
W16CA:
      lda  W107E+1                      
      sta  W104D+1                      
      lda  W10AF+1                      
      sta  W107E+1                      
      lda  W10E0+1                      
      sta  W10AF+1                      
      lda  W1111+1                      
      sta  W10E0+1                      
      lda  W1142+1                      
      sta  W1111+1                      
      lda  W1173+1                      
      sta  W1142+1                      
      lda  W11A4+1                      
      sta  W1173+1                      
      lda  W11D5+1                      
      sta  W11A4+1                      
      lda  W1206+1                      
      sta  W11D5+1                      
      lda  W1237+1                      
      sta  W1206+1                      
      lda  W1268+1                      
      sta  W1237+1                      
      lda  W1299+1                      
      sta  W1268+1                      
      lda  W12CA+1                      
      sta  W1299+1                      
      lda  W12FB+1                      
      sta  W12CA+1                      
      lda  W132C+1                      
      sta  W12FB+1                      
      lda  W135D+1                      
      sta  W132C+1                      
      lda  W138E+1                      
      sta  W135D+1                      
      lda  W13BF+1                      
      sta  W138E+1                      
      lda  W13F0+1                      
      sta  W13BF+1                      
      lda  W1421+1                      
      sta  W13F0+1                      
      lda  W1452+1                      
      sta  W1421+1                      
      lda  W1483+1                      
      sta  W1452+1                      
      lda  W14B4+1                      
      sta  W1483+1                      
      lda  W14E5+1                      
      sta  W14B4+1                      
      lda  W1516+1                      
      sta  W14E5+1                      
      lda  W1547+1                      
      sta  W1516+1                      
      lda  W1578+1                      
      sta  W1547+1                      
      lda  W15A9+1                      
      sta  W1578+1                      
      ldx  W1BAC                        
      lda  W3100,x                      
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BAD                        
      inc  W1BAD                        
      tax                               
      lda  W2600,x                      
      sta  W15A9+1                      
      ldx  W1BAD                        
      cpx  #$07                         
      bne  W1798                        
      lda  #$00                         
      sta  W1BAD                        
      inc  W1BAC                        
W1798:
      lda  W1083+1                      
      sta  W1052+1                      
      lda  W10B4+1                      
      sta  W1083+1                      
      lda  W10E5+1                      
      sta  W10B4+1                      
      lda  W1116+1                      
      sta  W10E5+1                      
      lda  W1147+1                      
      sta  W1116+1                      
      lda  W1178+1                      
      sta  W1147+1                      
      lda  W11A9+1                      
      sta  W1178+1                      
      lda  W11DA+1                      
      sta  W11A9+1                      
      lda  W120B+1                      
      sta  W11DA+1                      
      lda  W123C+1                      
      sta  W120B+1                      
      lda  W126D+1                      
      sta  W123C+1                      
      lda  W129E+1                      
      sta  W126D+1                      
      lda  W12CF+1                      
      sta  W129E+1                      
      lda  W1300+1                      
      sta  W12CF+1                      
      lda  W1331+1                      
      sta  W1300+1                      
      lda  W1362+1                      
      sta  W1331+1                      
      lda  W1393+1                      
      sta  W1362+1                      
W17FE:
      lda  W13C4+1                      
W1801:
      sta  W1393+1                      
      lda  W13F5+1                      
      sta  W13C4+1                      
W180A:
      lda  W1426+1                      
      sta  W13F5+1                      
      lda  W1457+1                      
      sta  W1426+1                      
W1816:
      lda  W1488+1                      
      sta  W1457+1                      
W181C:
      lda  W14B9+1                      
      sta  W1488+1                      
      lda  W14EA+1                      
      sta  W14B9+1                      
      lda  W151B+1                      
      sta  W14EA+1                      
      lda  W154C+1                      
      sta  W151B+1                      
W1834:
      lda  W157D+1                      
      sta  W154C+1                      
W183A:
      lda  W15AE+1                      
      sta  W157D+1                      
      ldx  W1BB3                        
      lda  W3200,x                      
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BB2                        
      inc  W1BB2                        
      tax                               
      lda  W2000,x                      
      sta  W15AE+1                      
      ldx  W1BB2                        
      cpx  #$07                         
      bne  W1866                        
      lda  #$00                         
      sta  W1BB2                        
      inc  W1BB3                        
W1866:
      lda  W1088+1                      
      sta  W1057+1                      
      lda  W10B9+1                      
      sta  W1088+1                      
      lda  W10EA+1                      
      sta  W10B9+1                      
      lda  W111B+1                      
      sta  W10EA+1                      
W187E:
      lda  W114C+1                      
      sta  W111B+1                      
      lda  W117D+1                      
      sta  W114C+1                      
      lda  W11AE+1                      
      sta  W117D+1                      
      lda  W11DF+1                      
      sta  W11AE+1                      
      lda  W1210+1                      
      sta  W11DF+1                      
      lda  W1241+1                      
      sta  W1210+1                      
      lda  W1272+1                      
      sta  W1241+1                      
      lda  W12A3+1                      
      sta  W1272+1                      
      lda  W12D4+1                      
      sta  W12A3+1                      
      lda  W1305+1                      
      sta  W12D4+1                      
      lda  W1336+1                      
      sta  W1305+1                      
      lda  W1367+1                      
      sta  W1336+1                      
      lda  W1398+1                      
      sta  W1367+1                      
      lda  W13C9+1                      
      sta  W1398+1                      
      lda  W13FA+1                      
      sta  W13C9+1                      
      lda  W142B+1                      
      sta  W13FA+1                      
      lda  W145C+1                      
      sta  W142B+1                      
      lda  W148D+1                      
      sta  W145C+1                      
      lda  W14BE+1                      
      sta  W148D+1                      
      lda  W14EF+1                      
      sta  W14BE+1                      
      lda  W1520+1                      
      sta  W14EF+1                      
      lda  W1551+1                      
      sta  W1520+1                      
      lda  W1582+1                      
      sta  W1551+1                      
      lda  W15B3+1                      
      sta  W1582+1                      
      ldx  W1BAA                        
      lda  W32FF+1,x                    
      asl                               
      asl                               
W1916:
      asl                               
      clc                               
      adc  W1BAB                        
      inc  W1BAB                        
      tax                               
      lda  W2600,x                      
      sta  W15B3+1                      
      ldx  W1BAB                        
      cpx  #$07                         
      bne  W1934                        
      lda  #$00                         
      sta  W1BAB                        
      inc  W1BAA                        
W1934:
      lda  W108D+1                      
      sta  W105C+1                      
      lda  W10BE+1                      
      sta  W108D+1                      
      lda  W10EF+1                      
      sta  W10BE+1                      
      lda  W1120+1                      
      sta  W10EF+1                      
      lda  W1151+1                      
      sta  W1120+1                      
      lda  W1182+1                      
      sta  W1151+1                      
      lda  W11B3+1                      
      sta  W1182+1                      
      lda  W11E4+1                      
      sta  W11B3+1                      
      lda  W1215+1                      
      sta  W11E4+1                      
      lda  W1246+1                      
      sta  W1215+1                      
      lda  W1277+1                      
      sta  W1246+1                      
      lda  W12A8+1                      
      sta  W1277+1                      
      lda  W12D9+1                      
      sta  W12A8+1                      
      lda  W130A+1                      
      sta  W12D9+1                      
      lda  W133B+1                      
      sta  W130A+1                      
      lda  W136C+1                      
      sta  W133B+1                      
      lda  W139D+1                      
      sta  W136C+1                      
      lda  W13CE+1                      
      sta  W139D+1                      
      lda  W13FF+1                      
      sta  W13CE+1                      
      lda  W1430+1                      
      sta  W13FF+1                      
      lda  W1461+1                      
      sta  W1430+1                      
      lda  W1492+1                      
      sta  W1461+1                      
      lda  W14C3+1                      
      sta  W1492+1                      
      lda  W14F4+1                      
      sta  W14C3+1                      
      lda  W1525+1                      
      sta  W14F4+1                      
      lda  W1556+1                      
      sta  W1525+1                      
      lda  W1587+1                      
      sta  W1556+1                      
      lda  W15B8+1                      
      sta  W1587+1                      
      ldx  W1BB0                        
      lda  W33FF+1,x                    
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BB1                        
      inc  W1BB1                        
      tax                               
      lda  W27FE+2,x                    
      sta  W15B8+1                      
      ldx  W1BB1                        
      cpx  #$07                         
      bne  W1A02                        
      lda  #$00                         
      sta  W1BB1                        
      inc  W1BB0                        
W1A02:
      lda  W1092+1                      
      sta  W1061+1                      
      lda  W10C3+1                      
      sta  W1092+1                      
W1A0E:
      lda  W10F4+1                      
      sta  W10C3+1                      
      lda  W1125+1                      
      sta  W10F4+1                      
W1A1A:
      lda  W1156+1                      
      sta  W1125+1                      
      lda  W1187+1                      
      sta  W1156+1                      
      lda  W11B8+1                      
      sta  W1187+1                      
      lda  W11E9+1                      
      sta  W11B8+1                      
      lda  W121A+1                      
      sta  W11E9+1                      
      lda  W124B+1                      
      sta  W121A+1                      
      lda  W127C+1                      
      sta  W124B+1                      
      lda  W12AD+1                      
      sta  W127C+1                      
      lda  W12DE+1                      
      sta  W12AD+1                      
      lda  W130F+1                      
      sta  W12DE+1                      
      lda  W1340+1                      
      sta  W130F+1                      
      lda  W1371+1                      
      sta  W1340+1                      
      lda  W13A2+1                      
      sta  W1371+1                      
      lda  W13D3+1                      
      sta  W13A2+1                      
      lda  W1404+1                      
      sta  W13D3+1                      
      lda  W1435+1                      
      sta  W1404+1                      
      lda  W1466+1                      
      sta  W1435+1                      
      lda  W1497+1                      
      sta  W1466+1                      
      lda  W14C8+1                      
      sta  W1497+1                      
      lda  W14F9+1                      
      sta  W14C8+1                      
      lda  W152A+1                      
      sta  W14F9+1                      
      lda  W155B+1                      
      sta  W152A+1                      
      lda  W158C+1                      
      sta  W155B+1                      
      lda  W15BD+1                      
      sta  W158C+1                      
      ldx  W1BAE                        
      lda  W34FF+1,x                    
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BAF                        
      inc  W1BAF                        
      tax                               
      lda  W2A00,x                      
      sta  W15BD+1                      
      ldx  W1BAF                        
      cpx  #$07                         
      bne  W1AD0                        
      lda  #$00                         
      sta  W1BAF                        
      inc  W1BAE                        
W1AD0:
      lda  W1097+1                      
      sta  W1066+1                      
      lda  W10C8+1                      
      sta  W1097+1                      
      lda  W10F9+1                      
      sta  W10C8+1                      
      lda  W112A+1                      
      sta  W10F9+1                      
      lda  W115B+1                      
      sta  W112A+1                      
      lda  W118C+1                      
      sta  W115B+1                      
      lda  W11BD+1                      
      sta  W118C+1                      
      lda  W11EE+1                      
      sta  W11BD+1                      
      lda  W121F+1                      
      sta  W11EE+1                      
      lda  W1250+1                      
      sta  W121F+1                      
      lda  W1281+1                      
      sta  W1250+1                      
      lda  W12B2+1                      
      sta  W1281+1                      
      lda  W12E3+1                      
      sta  W12B2+1                      
      lda  W1314+1                      
      sta  W12E3+1                      
      lda  W1345+1                      
      sta  W1314+1                      
      lda  W1376+1                      
      sta  W1345+1                      
      lda  W13A7+1                      
      sta  W1376+1                      
W1B36:
      lda  W13D8+1                      
      sta  W13A7+1                      
      lda  W1409+1                      
      sta  W13D8+1                      
      lda  W143A+1                      
      sta  W1409+1                      
      lda  W146B+1                      
      sta  W143A+1                      
      lda  W149C+1                      
      sta  W146B+1                      
      lda  W14CD+1                      
      sta  W149C+1                      
      lda  W14FE+1                      
      sta  W14CD+1                      
      lda  W152F+1                      
      sta  W14FE+1                      
      lda  W1560+1                      
      sta  W152F+1                      
      lda  W1591+1                      
      sta  W1560+1                      
      lda  W15C2+1                      
      sta  W1591+1                      
      ldx  W1BA8                        
      lda  W35FF+1,x                    
      asl                               
      asl                               
      asl                               
      clc                               
      adc  W1BA9                        
      inc  W1BA9                        
      tax                               
      lda  W2C00,x                      
      sta  W15C2+1                      
      ldx  W1BA9                        
      cpx  #$07                         
      bne  W1B9E                        
      lda  #$00                         
      sta  W1BA9                        
      inc  W1BA8                        
W1B9E:
      bit  $FFFF                        
      jmp  $EA81                        

W1BA4:
      brk                               
W1BA5:
      brk                               
      brk                               
      brk                               
W1BA8:
      brk                               
W1BA9:
      brk                               
W1BAA:
      brk                               
W1BAB:
      brk                               
W1BAC:
      brk                               
W1BAD:
      brk                               
W1BAE:
      brk                               
W1BAF:
      brk                               
W1BB0:
      brk                               
W1BB1:
      brk                               
W1BB2:
      brk                               
W1BB3:
      brk                               
      lda  $D019                        // Interrupt indicator register
      sta  $D019                        // Interrupt indicator register
      lda  #$80                         
      sta  $D012                        // Reading/Writing IRQ balance value
      lda  #$5E                         
      sta  $0314                        // Vector: Hardware Interrupt (IRQ)
      lda  #$1C                         
      sta  $0315                        // Vector: Hardware Interrupt (IRQ)
      dec  W1C5C                        
      ldy  W1C5C                        
      sty  $D016                        // VIC control register
      ldx  #$64                         
W1BD4:
      dex                               
      bne  W1BD4                        
      ldx  #$08                         
      stx  $D016                        // VIC control register
      ldy  W1C5C                        
      bne  W1C13                        
      lda  #$08                         
      sta  W1C5C                        
      ldx  #$00                         
W1BE8:
      lda  $0479,x                      // Video matrix (25*40)
      sta  $0478,x                      // Video matrix (25*40)
      inx                               
      cpx  #$26                         
      bne  W1BE8                        
      ldx  W1C5C+1                      
      bne  W1C07                        
      inc  W1C0A+2                      
      ldx  W1C0A+2                      
      cpx  #$0B                         
W1C00:
      bne  W1C07                        
      lda  #$09                         
W1C04:
      sta  W1C0A+2                      
W1C07:
      ldx  W1C5C+1                      
W1C0A:
      lda  $0900,x                      
W1C0D:
      sta  $049E                        // Video matrix (25*40)
      inc  W1C5C+1                      
W1C13:
      ldy  #$92                         
W1C15:
      cpy  $D012                        // Reading/Writing IRQ balance value
      bne  W1C15                        
      nop                               
      nop                               
W1C1C:
      ldx  #$06                         
W1C1E:
      lda  $D012                        // Reading/Writing IRQ balance value
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1C26                        
W1C26:
      ldy  #$09                         
W1C28:
      dey                               
      bne  W1C28                        
      dex                               
      nop                               
      bne  W1C1E                        
      nop                               
      nop                               
      ldx  #$06                         
W1C33:
      lda  $D012                        // Reading/Writing IRQ balance value
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1C3B                        
W1C3B:
      ldy  #$09                         
W1C3D:
      dey                               
      bne  W1C3D                        
      dex                               
      nop                               
      bne  W1C33                        
      nop                               
      nop                               
      ldx  #$06                         
W1C48:
      lda  $D012                        // Reading/Writing IRQ balance value
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1C50                        
W1C50:
      ldy  #$09                         
W1C52:
      dey                               
      bne  W1C52                        
      dex                               
      nop                               
      bne  W1C48                        
      jmp  $FEBC                        // Restores cpu registers and goes out from interrupt

W1C5C:
      slo  $00                          // Undocument command
      lda  $D019                        // Interrupt indicator register
      sta  $D019                        // Interrupt indicator register
      lda  #$F8                         
      sta  $D012                        // Reading/Writing IRQ balance value
      lda  #$2E                         
      sta  $0314                        // Vector: Hardware Interrupt (IRQ)
      lda  #$10                         
      sta  $0315                        // Vector: Hardware Interrupt (IRQ)
      bit  $00                          
      bit  $00                          
      bit  $00                          
      ldx  #$06                         
W1C7B:
      lda  $D012                        // Reading/Writing IRQ balance value
W1C7E:
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1C83                        
W1C83:
      ldy  #$09                         
W1C85:
      dey                               
      bne  W1C85                        
      dex                               
      nop                               
      bne  W1C7B                        
      inc  $FFFF                        
      dec  $FFFF                        
      ldx  #$06                         
W1C94:
      lda  $D012                        // Reading/Writing IRQ balance value
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1C9C                        
W1C9C:
      ldy  #$09                         
W1C9E:
      dey                               
      bne  W1C9E                        
      dex                               
      nop                               
      bne  W1C94                        
      inc  $D020                        // Border color
      dec  $D020                        // Border color
      ldx  #$01                         
W1CAD:
      lda  $D012                        // Reading/Writing IRQ balance value
      cmp  $D012                        // Reading/Writing IRQ balance value
      beq  W1CB5                        
W1CB5:
      ldy  #$09                         
W1CB7:
      dey                               
      bne  W1CB7                        
      dex                               
W1CBB:
      nop                               
      bne  W1CAD                        
      jmp  $EA81                        

      beq  W1CC3                        
W1CC3:
      ldy  #$09                         
W1CC5:
      dey                               
      bne  W1CC5                        
      dex                               
      nop                               
      bne  W1CBB                        
      jmp  $EA81                        

      *=$2000

W2000:
      brk                               
W2001:
      noop $6E66,x                      
W2004:
      rts                               

W2005:
      noop $0000,x                      // Undocument command
      brk                               
W2009:
      clc                               
      noop $7E66,x                      
W200D:
      ror  $00                          
W200F:
      brk                               
      brk                               
W2011:
      noop $7C66,x                      
      ror  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
W2018:
      brk                               
      noop $6066,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
W2020:
      brk                               
      sei                               
      jmp  ($6C66)                      

      sei                               
      brk                               
      brk                               
      brk                               
      ror  $7860,x                      
      rts                               

W202D:
      ror  $0000,x                      
      brk                               
      ror  $7860,x                      
      rts                               

      rts                               

      brk                               
      brk                               
      brk                               
      noop $6C60,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $6666,x                      
      brk                               
      brk                               
      brk                               
      noop W1816+2,x                    
      clc                               
      noop $0000,x                      // Undocument command
      brk                               
      asl  $0C0C,x                      
      jmp  ($0038)                      // Pointer: BASIC ending memory

      brk                               
      brk                               
      ror  $78                          // CHRGET (Introduce a char) subroutine
      bvs  W20D4+1                      
      ror  $00                          
      brk                               
      brk                               
      rts                               

      rts                               

      rts                               

      rts                               

      ror  $0000,x                      
      brk                               
      rra  ($77,x)                      // CHRGET (Introduce a char) subroutine
      rra  $636B,x                      
      brk                               
      brk                               
      brk                               
      ror  $76                          // CHRGET (Introduce a char) subroutine
      ror  $666E,x                      
      brk                               
      brk                               
      brk                               
      noop $6666,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      noop $7C66,x                      
      rts                               

      rts                               

      brk                               
      brk                               
      brk                               
      noop $6666,x                      
      ror  $063C                        // Video matrix (25*40)
      brk                               
      brk                               
      noop $7C66,x                      
      jmp  ($0066)                      // Floating point accumulator #1: Sign

      brk                               
      brk                               
W2099:
      noop $3860,x                      
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      ror  W1816+2,x                    
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $66                          // Floating point accumulator #1: Sign
      noop $0000,x                      // Undocument command
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $3C                          // BASIC precedent line number
      clc                               
      brk                               
      brk                               
      brk                               
      rra  ($6B,x)                      // Floating point accumulator #2: Mantissa
      rra  $6377,x                      
      brk                               
      brk                               
      brk                               
      ror  $3C                          // BASIC precedent line number
      clc                               
      noop $0066,x                      // Floating point accumulator #1: Sign
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      noop W1816+2,x                    
      brk                               
      brk                               
      brk                               
      ror  W180A+2,x                    
W20D4:
      bmi  W2153+1                      
      brk                               
      brk                               
      brk                               
      noop W3030,x                      
      bmi  W2119+1                      
      brk                               
      brk                               
      brk                               
      noop $7832,x                      
      jam                               // Illegal instruction
      noop $0000,x                      // Undocument command
      brk                               
      noop $0C0C,x                      
      noop $003C                        // BASIC precedent line number
      brk                               
      brk                               
      clc                               
      noop W187E,x                      
      clc                               
      brk                               
      brk                               
      brk                               
      bpl  W212B                        
      rra  W102E+2,x                    
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      clc                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2119:
      ror  $FF                          // Transient data area of BASIC
      ror  $FF                          // Transient data area of BASIC
      ror  $00                          
      brk                               
      brk                               
      rol  $3C68,x                      
      asl  $7C,x                        // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      ror  $0C                          // Flag: default dimension for DIM
W212B:
      clc                               
      bmi  W2194                        
      brk                               
      brk                               
      brk                               
      noop                              // Undocument command
      bit  $38                          // Pointer: BASIC ending memory
      adc  $3E                          // Pointer: BASIC instruction for CONT
      brk                               
      brk                               
      brk                               
      asl  $0C                          // Flag: default dimension for DIM
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      bmi  W2174                        
      bmi  W215E                        
      brk                               
      brk                               
      brk                               
      clc                               
      noop $0C0C                        
      clc                               
      brk                               
      brk                               
      brk                               
      ror  $3C                          // BASIC precedent line number
W2153:
      isb  $663C,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      ror  W1816+2,x                    
W215E:
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2168                        
W2168:
      brk                               
      brk                               
      brk                               
      ror  $0000,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2174:
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      asl  $0C                          // Flag: default dimension for DIM
      clc                               
      bmi  W21DE                        
      brk                               
      brk                               
      brk                               
      noop $766E,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      clc                               
      sec                               
      clc                               
      clc                               
      ror  $0000,x                      
      brk                               
      noop $0C66,x                      
W2194:
      clc                               
      ror  $0000,x                      
      brk                               
      noop $0C66,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      asl  $1E                          
      rol  $7F,x                        // CHRGET (Introduce a char) subroutine
      asl  $00                          
      brk                               
      brk                               
      ror  $7C60,x                      
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      noop $7C60,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      ror  $0C66,x                      
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      noop $3C66,x                      
      ror  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      noop $3E66,x                      
      asl  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
W21DE:
      bmi  W21E0                        
W21E0:
      brk                               
      clc                               
      bmi  $2244                        
      bmi  $21FE                        
      brk                               
      brk                               
      brk                               
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      noop $0C06                        
      clc                               
      brk                               
      brk                               
      noop $0666,x                      // Video matrix (25*40)
      noop W17FE+2                      
      *=$2400

W2400:
      isb  $FFFF,x                      // Undocument command
      isb  $FFFF,x                      // Undocument command
      isb  $0CFF,x                      
      rol  $6636,x                      
      ror  $C6C6,x                      
      brk                               
      noop $06FE,x                      // Video matrix (25*40)
      noop $FEC6,x                      // Undocument command
      noop $7C00,x                      
      inc  $C0C6,x                      
      dec  $FE                          // Free 0 page for user program
      noop $FC00,x                      // Undocument command
      inc  $C606,x                      
      dec  $FE                          // Free 0 page for user program
      noop $7E00,x                      
      inc  $FEC0,x                      
      cpy  #$FE                         
      ror  $FE00,x                      // Routine SETLFS of KERNAL
      inc  $FC00,x                      
W2434:
      cpy  #$C0                         
      cpy  #$00                         
      noop $C0FE,x                      
      dec  $FEC6                        
      noop $C600,x                      
      dec  $C6                          // Number of char in keyboard buffer
      inc  $C6,x                        // Number of char in keyboard buffer
      dec  $C6                          // Number of char in keyboard buffer
      brk                               
      ror  W187E,x                      
      clc                               
      clc                               
      ror  $007E,x                      // CHRGET (Introduce a char) subroutine
      ror  $0C7E,x                      
      cpy  $FCCC                        
      sei                               
      brk                               
      cpy  $F0D8                        
      beq  W2434+1                      
      cpy  $00C6                        // Number of char in keyboard buffer
      isb  $C0C0,y                      
      cpy  #$C0                         
      inc  $007E,x                      // CHRGET (Introduce a char) subroutine
      dec  $EE                          // Table of screen line/Transient editor
      inc  $D6FE,x                      // SID images
      dec  $C6                          // Number of char in keyboard buffer
      brk                               
      cpy  $FCEC                        
      noop $CCDC,x                      
      cpy  $7C00                        
      inc  $C6C6,x                      
      dec  $FE                          // Free 0 page for user program
      noop $FC00,x                      // Undocument command
      inc  $FC06,x                      
      cpy  #$C0                         
      cpy  #$00                         
      noop $C6FE,x                      
      dec  $C6                          // Number of char in keyboard buffer
      inc  $007B,x                      // CHRGET (Introduce a char) subroutine
      sed                               
      inc  $FC06,x                      
      dec  $C6                          // Number of char in keyboard buffer
      dec  $00                          
      ror  $C0FE,x                      
      noop $FE06,x                      // Undocument command
      noop $F800,x                      // Undocument command
      noop $0C0C,x                      
      noop $0C0C                        
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      dec  $C6                          // Number of char in keyboard buffer
      dec  $FE                          // Free 0 page for user program
      noop $C600,x                      
      dec  $C6                          // Number of char in keyboard buffer
      dcp  $EE                          // Table of screen line/Transient editor
      noop $0038,x                      // Pointer: BASIC ending memory
      dec  $C6                          // Number of char in keyboard buffer
      dec  $FE,x                        // Free 0 page for user program
      inc  $C6EE,x                      
      brk                               
      dec  $EE                          // Table of screen line/Transient editor
      noop $7C38,x                      
      inc  $00C6                        // Number of char in keyboard buffer
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $3C                          // BASIC precedent line number
      clc                               
      clc                               
      clc                               
      brk                               
      inc  $1CFE,x                      
      sec                               
W24D4:
      bvs  W24D4                        
      inc  $C000,x                      
      sed                               
      cld                               
      inc  $0618,x                      // Video matrix (25*40)
      asl  $0000,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      noop                              // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      tax                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      noop $00,x                        // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      clc                               
      clc                               
      brk                               
      clc                               
      clc                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $00                          
      brk                               
      brk                               
      brk                               
      brk                               
      rol  $00C0,x                      // Stop motor of tape
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      bpl  W259E+2                      
      bne  W259E+2                      
      asl  $FC,x                        
      bpl  W2528                        
W2528:
      jam                               // Illegal instruction
      dec  $DC,x                        // Table of screen line/Transient editor
      noop $D676,x                      // SID images
      sty  $7000                        
      cld                               
      rra  ($FE),y                      // Free 0 page for user program
      cpy  $7BFE                        
      brk                               
      clc                               
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      bmi  W25A3                        
      rts                               

      rts                               

      bmi  W255F                        
      brk                               
      bmi  W2562                        
      noop $0C0C                        
      clc                               
      bmi  W2550                        
W2550:
      brk                               
      noop $38,x                        // Pointer: BASIC ending memory
      noop $5438,x                      
      brk                               
      brk                               
      brk                               
      bmi  W258A+1                      
      noop W3030,x                      
      brk                               
W255F:
      brk                               
      brk                               
      brk                               
W2562:
      brk                               
      brk                               
      brk                               
      bmi  W2596+1                      
      rts                               

      brk                               
      brk                               
      brk                               
      noop $0000,x                      // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      bmi  W25A6+1                      
      brk                               
      asl  $0E                          // Data type: case 0x80=Intero, case 0x00=Reale
      noop $7038,x                      
      cpx  #$C0                         
      brk                               
      noop $CEFE,x                      
      dec  $E6,x                        // Table of screen line/Transient editor
      inc  $007C,x                      // CHRGET (Introduce a char) subroutine
      bmi  W25F8+2                      
W258A:
      bmi  W25BC                        
      bmi  W258A                        
      noop $FC00,x                      // Undocument command
      inc  $3C0E,x                      
W2594:
      beq  W2594                        
W2596:
      inc  $FC00,x                      
      inc  $7C06,x                      
      asl  $FE                          // Free 0 page for user program
W259E:
      noop $C000,x                      
      cpy  #$CC                         
W25A3:
      cpy  $FEFE                        
W25A6:
      noop $FE00                        // Routine SETLFS of KERNAL
      inc  $FCC0,x                      
      asl  $FCFE                        
      brk                               
      ror  $C0FE,x                      
      noop $FEC6,x                      // Undocument command
      noop $FE00,x                      // Routine SETLFS of KERNAL
      inc  W1C0D+1,x                    
W25BC:
      sec                               
      sec                               
      sec                               
      brk                               
      noop $C6FE,x                      
      noop $FEC6,x                      // Undocument command
      noop $7C00,x                      
      inc  $7EC6,x                      
      asl  $FE                          // Free 0 page for user program
      noop $0000,x                      // Undocument command
      bmi  W2603                        
      brk                               
      bmi  W2604+2                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      brk                               
      clc                               
      clc                               
      bmi  W25E0                        
W25E0:
      slo  ($06,x)                      // Jump Vector: integer-real conversion
      noop W3017+1                      
      rts                               

      isb  $C000,x                      
      rts                               

      bmi  W2604                        
      noop $FF06                        // Undocument command
      brk                               
      bvs  W260A                        
      noop $0C06                        
      clc                               
      bvs  W25F8                        
W25F8:
      noop $0666,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
      brk                               
      brk                               
W2600:
      isb  $FF00,x                      // Undocument command
W2603:
      brk                               
W2604:
      isb  $FF00,x                      // Undocument command
      brk                               
      brk                               
      brk                               
W260A:
      rra  $7F03,x                      
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      brk                               
      brk                               
      brk                               
      rra  $7E03,x                      
      rra  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $6000,x                      
      rts                               

      rra  $0000,x                      // Undocument command
      brk                               
      ror  $6303,x                      
      rra  ($7E,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $7800,x                      
      rts                               

      rra  $0000,x                      // Undocument command
      brk                               
      rra  $7800,x                      
      rts                               

      rts                               

      brk                               
      brk                               
      brk                               
      rra  $6300,x                      
      adc  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      rra  $6363,x                      
      brk                               
      brk                               
      brk                               
      ror  W1816+2,x                    
      clc                               
      ror  $0000,x                      
      brk                               
      slo  $0606,x                      // Video matrix (25*40)
      ror  $7E                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  ($66,x)                      // Floating point accumulator #1: Sign
      noop $6366,x                      
      brk                               
      brk                               
      brk                               
      rts                               

      rts                               

      rts                               

      rra  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  ($77,x)                      // CHRGET (Introduce a char) subroutine
      rra  $636B,x                      
      brk                               
      brk                               
      brk                               
      rra  ($7B),y                      // CHRGET (Introduce a char) subroutine
      rra  $6367                        
      brk                               
      brk                               
      brk                               
      rra  $6303,x                      
      rra  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $7F03,x                      
      rts                               

      rts                               

      brk                               
      brk                               
      brk                               
      rra  $6303,x                      
      rra  $7F                          // CHRGET (Introduce a char) subroutine
      slo  ($00,x)                      // Undocument command
      brk                               
      rra  $7F03,x                      
      ror  $63                          // Floating point accumulator #1: Mantissa
      brk                               
      brk                               
      brk                               
      rra  $7F00,x                      
      slo  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      isb  W1816+2,x                    
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      rra  $0000,x                      // Undocument command
      brk                               
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      rra  ($36,x)                      // Pointer: strings for auxiliari programs
      noop $0000,x                      // Undocument command
      brk                               
      rra  ($6B,x)                      // Floating point accumulator #2: Mantissa
      rra  $6377,x                      
      brk                               
      brk                               
      brk                               
      rra  ($3E,x)                      // Pointer: BASIC instruction for CONT
      noop $633E,x                      
      brk                               
      brk                               
      brk                               
      rra  ($63,x)                      // Floating point accumulator #1: Mantissa
      rra  $7F03,x                      
      brk                               
      brk                               
      brk                               
      rra  W1C07,x                      
      bvs  W2754+2                      
      brk                               
      brk                               
      brk                               
      noop $6060,x                      
      rts                               

      noop $0000,x                      // Undocument command
      brk                               
      rra  $5541,x                      
      eor  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rol  $0606,x                      // Video matrix (25*40)
      asl  $3E                          // Pointer: BASIC instruction for CONT
      brk                               
      brk                               
      isb  $7C70,x                      
      bvs  W2766                        
      sbc  $0000,y                      
      inc  $FEE6,x                      
      cpx  #$E0                         
      beq  W2700                        
W2700:
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      sec                               
      sec                               
      sec                               
      sec                               
      brk                               
      sec                               
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      isb  $FF66,x                      // Undocument command
      ror  $FF                          // Transient data area of BASIC
      brk                               
      brk                               
      php                               
      rra  $7F68,x                      
      anc  #$7F                         // Unusual operation
      php                               
      brk                               
      brk                               
      rla  ($06),y                      // Jump Vector: integer-real conversion
      noop W3317+1                      
      brk                               
      brk                               
      brk                               
      brk                               
      php                               
      rol  $0008,x                      // Flag: search the quotation marks at the end of one string
      brk                               
      brk                               
      brk                               
      asl  $0C                          // Flag: default dimension for DIM
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      bmi  W2775                        
      bmi  W275D+2                      
      brk                               
      brk                               
      brk                               
      clc                               
      noop $0C0C                        
      clc                               
      brk                               
      brk                               
      brk                               
      ror  $18                          // Last transient strings address
W2754:
      ror  $6618,x                      
      brk                               
      brk                               
      brk                               
      noop $7F1C,x                      
W275D:
      noop $001C,x                      // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
W2766:
      clc                               
      bmi  W2769                        
W2769:
      brk                               
      brk                               
      brk                               
      rol  $0054,x                      // Vector of jump fusion
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2775:
      clc                               
      clc                               
      brk                               
      brk                               
      brk                               
      asl  $0C                          // Flag: default dimension for DIM
      clc                               
      bmi  W27DF                        
      brk                               
      brk                               
      brk                               
      rra  $6B67,x                      
      rra  ($7F),y                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      sec                               
      clc                               
      clc                               
      clc                               
      ror  $0000,x                      
      brk                               
      rra  $7F03,x                      
      rts                               

      rra  $0000,x                      // Undocument command
      brk                               
      rra  $0F03,x                      
      slo  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rts                               

      ror  $7F                          // CHRGET (Introduce a char) subroutine
      asl  $06                          // Jump Vector: integer-real conversion
      brk                               
      brk                               
      brk                               
      rra  $7F60,x                      
      slo  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $7F60,x                      
      rra  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $0C06,x                      
      noop $000C                        // Flag: default dimension for DIM
      brk                               
      brk                               
      rra  $7F63,x                      
      rra  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rra  $7F63,x                      
      slo  ($7F,x)                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      clc                               
      clc                               
W27DF:
      bmi  W27E1                        
W27E1:
      brk                               
      noop $6030,x                      
      bmi  W2803                        
      brk                               
      brk                               
      brk                               
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      sec                               
      noop $0C06                        
      sec                               
      brk                               
      brk                               
      brk                               
      rra  W1C07,x                      
      brk                               
W27FE:
      noop $0000,x                      // Undocument command
      brk                               
      brk                               
W2803:
      isb  $FFFF,x                      // Undocument command
      isb  $00FF,x                      // Transient data area of BASIC
      brk                               
      rol  $3F07,x                      
      rra  $3B,x                        // BASIC precedent line number
      brk                               
      brk                               
      bvs  W2882+1                      
      ror  $7777,x                      
      ror  $0000                        
      brk                               
      rol  $7077,x                      
      rra  $3E,x                        // Pointer: BASIC instruction for CONT
      brk                               
      brk                               
      slo  $07                          // Search char
      rla  $7777,x                      
      rla  $0000,y                      // Undocument command
      brk                               
      rol  $7F77,x                      
      bvs  W286C+1                      
      brk                               
      brk                               
      slo  $3F1C                        
      noop W1C1C,x                      
      brk                               
      brk                               
      brk                               
      rla  $7777,y                      
      rla  $7E07,x                      
      brk                               
      bvs  W28B2+1                      
      ror  $7777,x                      
      rra  $00,x                        // Undocument command
      brk                               
      noop $3C00,x                      
      noop $3E1C,x                      
      brk                               
      brk                               
      slo  $00                          // Undocument command
      slo  $0707                        // Video matrix (25*40)
      slo  $3E                          // Pointer: BASIC instruction for CONT
      brk                               
      bvs  W28CE                        
      ror  $7C,x                        // CHRGET (Introduce a char) subroutine
      ror  $73,x                        // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      noop W1C1C,x                      
      noop $3E1C,x                      
      brk                               
      brk                               
      brk                               
      ror  $7F                          // CHRGET (Introduce a char) subroutine
W286C:
      rra  $636B,x                      
      brk                               
      brk                               
      brk                               
      ror  $7777                        
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      rol  $7777,x                      
      rra  $3E,x                        // Pointer: BASIC instruction for CONT
      brk                               
      brk                               
      brk                               
W2882:
      ror  $7777                        
      ror  $7070,x                      
      brk                               
      brk                               
      rla  $7777,y                      
      rla  $0707,x                      // Video matrix (25*40)
      brk                               
      brk                               
      ror  $7077                        
      bvs  W2907                        
      brk                               
      brk                               
      brk                               
      rla  $3E70,x                      
      slo  $7E                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      noop W1C7E+1,x                    
      noop $0F1C,x                      
      brk                               
      brk                               
      brk                               
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rla  $0000,y                      // Undocument command
      brk                               
W28B2:
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rra  $3E,x                        // Pointer: BASIC instruction for CONT
      noop $0000,x                      // Undocument command
      brk                               
      rra  ($6B,x)                      // Floating point accumulator #2: Mantissa
      rra  W363D+1,x                    
      brk                               
      brk                               
      brk                               
      rra  $3E,x                        // Pointer: BASIC instruction for CONT
      noop $773E,x                      
      brk                               
      brk                               
      brk                               
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rra  $3F,x                        // DATA current line number
W28CE:
      asl  $007C                        // CHRGET (Introduce a char) subroutine
      brk                               
W28D2:
      rra  W1C0D+1,x                    
      sec                               
W28D6:
      rra  $3C00,x                      
      bmi  W2909+2                      
      bmi  W290C+1                      
      bmi  W291A+1                      
      brk                               
      cpy  #$F0                         
      beq  W28D2+2                      
      beq  W28D6                        
      beq  W28D6+2                      
      noop $0C0C,x                      
      noop $0C0C                        
      noop $0000,x                      // Undocument command
      clc                               
      noop W187E,x                      
      clc                               
      clc                               
      clc                               
      brk                               
      bpl  W292B                        
      rra  W307E+1,x                    
      bpl  W2900                        
W2900:
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2907:
      brk                               
      brk                               
W2909:
      rol  $3E3E,x                      
W290C:
      noop W1C00,x                      
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $00                          
      brk                               
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
W291A:
      isb  $FF66,x                      // Undocument command
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      clc                               
      rol  $3C60,x                      
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      clc                               
      brk                               
      jam                               // Illegal instruction
      ror  $0C                          // Flag: default dimension for DIM
W292B:
      clc                               
      bmi  W2994                        
      lsr  $00                          
      noop $3C66,x                      
      sec                               
      rra  $66                          // Floating point accumulator #1: Sign
      rla  $0600,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      asl  W181C                        
      clc                               
      noop $000E,x                      // Data type: case 0x80=Intero, case 0x00=Reale
      brk                               
      bvs  W2981+2                      
      clc                               
      clc                               
      sec                               
      bvs  W2950                        
W2950:
      brk                               
      ror  $3C                          // BASIC precedent line number
      isb  $663C,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      ror  W1816+2,x                    
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      noop $381C,x                      
      brk                               
      brk                               
      brk                               
      ror  $0000,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      sec                               
      sec                               
      brk                               
      brk                               
      slo  $0E                          // Data type: case 0x80=Intero, case 0x00=Reale
      noop $7038,x                      
      rts                               

      brk                               
      brk                               
W2981:
      rol  $6F67,x                      
      rra  $3E73,y                      
      brk                               
      brk                               
      noop W1C3B+1,x                    
      noop $7F1C,x                      
      brk                               
      brk                               
      rol  $0E67,x                      
W2994:
      noop $7F38,x                      
      brk                               
      brk                               
      rra  W1C0D+1,x                    
      asl  $3E67                        
      brk                               
      brk                               
      asl  $3E1E                        
      ror  $0E7F                        
      brk                               
      brk                               
      rra  $7E70,x                      
      slo  $77                          // CHRGET (Introduce a char) subroutine
      rol  $0000,x                      
      rol  $7E70,x                      
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rol  $0000,x                      
      rra  $0E07,x                      
      noop $3838,x                      
      brk                               
      brk                               
      rol  $3E77,x                      
      rra  $77,x                        // CHRGET (Introduce a char) subroutine
      rol  $0000,x                      
      rol  $3F77,x                      
      slo  $0E                          // Data type: case 0x80=Intero, case 0x00=Reale
      noop $0000,x                      // Undocument command
      brk                               
      noop $001C,x                      // Undocument command
      noop $001C,x                      // Undocument command
      brk                               
      brk                               
      noop $001C,x                      // Undocument command
      noop $381C,x                      
      asl  $381C                        
      bvs  W2A1D                        
      noop $000E,x                      // Data type: case 0x80=Intero, case 0x00=Reale
      brk                               
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
      brk                               
      bvs  W2A2A                        
      noop W1C0D+1,x                    
      sec                               
      bvs  W29F8                        
W29F8:
      brk                               
      rol  $0E77,x                      
      noop W1C00,x                      
      brk                               
W2A00:
      ror  $9D81,x                      
      lda  ($A1,x)                      // Real time clock HMS (1/60 sec)
      sta  $7E81,x                      
      brk                               
      brk                               
      noop $7606,x                      
      dec  $7E                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      cpy  #$C0                         
      noop $C6C6,x                      
      noop $0000,x                      // Undocument command
      brk                               
      noop $C0C0,x                      
W2A1D:
      cpy  #$7C                         
      brk                               
      brk                               
      asl  $06                          // Jump Vector: integer-real conversion
      ror  $C6,x                        // Number of char in keyboard buffer
      dec  $7E                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
W2A2A:
      noop $DEC6,x                      // Undocument command
      cpy  #$7C                         
      brk                               
      brk                               
      asl  $7630,x                      
      bmi  W2A66                        
      bmi  W2A38                        
W2A38:
      brk                               
      brk                               
      ror  $C6C6,x                      
      ror  $06,x                        // Jump Vector: integer-real conversion
      noop $C000,x                      
      cpy  #$DC                         
      dec  $C6                          // Number of char in keyboard buffer
      dec  $00                          
      brk                               
      clc                               
      brk                               
      sec                               
      clc                               
      clc                               
      noop $0000,x                      // Undocument command
      asl  $00                          
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      noop $C000,x                      
      cpy  #$CC                         
      cld                               
      cpy  $00C6                        // Number of char in keyboard buffer
      brk                               
      bmi  W2A7A+1                      
      clc                               
      clc                               
      clc                               
W2A66:
      noop $0000,x                      // Undocument command
      brk                               
      dec  $6C                          // Floating point accumulator #2: Mantissa
      tsx                               
      dec  $C6,x                        // Number of char in keyboard buffer
      brk                               
      brk                               
      brk                               
      noop $C6C6,x                      
      dec  $C6                          // Number of char in keyboard buffer
      brk                               
      brk                               
      brk                               
W2A7A:
      noop $C6C6,x                      
      dec  $5C                          // Scratch for numeric operation
      brk                               
      brk                               
      brk                               
      noop $C6C6,x                      
      noop $C0C0,x                      
      brk                               
      brk                               
      ror  $C6C6,x                      
      ror  $06,x                        // Jump Vector: integer-real conversion
      asl  $00                          
      brk                               
      noop $C0C6,x                      
      cpy  #$C0                         
      brk                               
      brk                               
      brk                               
      ror  $7CC0,x                      
      asl  $FC                          
      brk                               
      brk                               
W2AA1:
      bmi  W2AA1                        
      bmi  W2AD5                        
      bmi  W2AC4+1                      
      brk                               
      brk                               
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      dec  $C6                          // Number of char in keyboard buffer
      ror  $00,x                        
      brk                               
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      dec  $6C                          // Floating point accumulator #2: Mantissa
      sec                               
      brk                               
      brk                               
      brk                               
      dec  $D6                          // Cursor line number
      tsx                               
      jmp  ($00C6)                      // Number of char in keyboard buffer

      brk                               
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
W2AC4:
      jmp  ($C6C6)                      

      brk                               
      brk                               
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      dec  $76                          // CHRGET (Introduce a char) subroutine
      noop $0078                        // CHRGET (Introduce a char) subroutine
      brk                               
      inc  W3017+1,x                    
W2AD5:
      rts                               

      inc  $7F00,x                      
      rra  $0C0C,x                      
      noop $0C0C                        
      brk                               
      sax  ($C7,x)                      // Flag: Write inverse chars: 1=yes 0=not used
      isb  $397D                        
      ora  ($01),y                      // 6510 I/O register
      brk                               
      sbc  $80FC,x                      
      noop #$80                         // Undocument command
      inc  $00FE,x                      // Free 0 page for user program
      brk                               
      clc                               
      noop W187E,x                      
      clc                               
      clc                               
      clc                               
      brk                               
      bpl  W2B2B                        
      rra  W307E+1,x                    
      bpl  W2B00                        
W2B00:
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      noop W180A+2                      
      clc                               
      brk                               
      bmi  W2B3F                        
      brk                               
      ror  $CC                          // Flash state: 0=flashing
      cpy  $0000                        
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      isb  $FF66,x                      // Undocument command
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      clc                               
      rol  $3C60,x                      
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      clc                               
      brk                               
      jam                               // Illegal instruction
      ror  $0C                          // Flag: default dimension for DIM
W2B2B:
      clc                               
      bmi  W2B93+1                      
      lsr  $00                          
      noop $74C6,x                      
      cli                               
      dcp  $C6                          // Number of char in keyboard buffer
      rra  $0600,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
      brk                               
      brk                               
      brk                               
W2B3F:
      brk                               
      noop W3017+1                      
      bvs  W2B75                        
      clc                               
      noop W3000                        
      clc                               
      noop $0C0E                        
      clc                               
      bmi  W2B50                        
W2B50:
      brk                               
      ror  $3C                          // BASIC precedent line number
      isb  $663C,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      ror  W1816+2,x                    
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      noop $380C                        
      brk                               
      brk                               
      brk                               
      ror  $0000,x                      
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2B75:
      clc                               
      clc                               
      brk                               
      brk                               
      slo  ($06,x)                      // Jump Vector: integer-real conversion
      noop W3017+1                      
      rts                               

      brk                               
      noop $CEC6,x                      
      dec  $E6,x                        // Table of screen line/Transient editor
      dec  $5C                          // Scratch for numeric operation
      brk                               
      clc                               
      clc                               
      sec                               
      clc                               
      clc                               
      clc                               
      ror  $7C00,x                      
      dec  $06                          // Jump Vector: integer-real conversion
W2B93:
      noop $C060,x                      
      inc  $7C00,x                      
      dec  $06                          // Jump Vector: integer-real conversion
      noop $C606,x                      
      noop W15FF+1,x                    
      rol  $66,x                        // Floating point accumulator #1: Sign
      dec  $FE                          // Free 0 page for user program
      asl  $06                          // Jump Vector: integer-real conversion
      brk                               
      inc  $FCC0,x                      
      asl  $06                          // Jump Vector: integer-real conversion
      dec  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      noop $C0C6,x                      
      noop $C6C6,x                      
      noop $FE00,x                      // Routine SETLFS of KERNAL
      dec  $0C                          // Flag: default dimension for DIM
      sec                               
      clc                               
      clc                               
      clc                               
      brk                               
      noop $C6C6,x                      
      noop $C6C6,x                      
      noop $7C00,x                      
      dec  $C6                          // Number of char in keyboard buffer
      ror  $06,x                        // Jump Vector: integer-real conversion
      dec  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2BF8+1                      
      rol  $6C,x                        // Floating point accumulator #2: Mantissa
      cld                               
      jmp  (W1834+2)                    

      brk                               
      brk                               
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      jmp  (W1B36)                      

      rol  $6C,x                        // Floating point accumulator #2: Mantissa
      clc                               
      brk                               
W2BF8:
      noop $06C6,x                      // Video matrix (25*40)
      noop $0030,x                      // Pointer: BASIC starting arrays
      bmi  W2C00                        
W2C00:
      noop $6E66,x                      
      ror  $6260                        
      noop $FC00,x                      // Undocument command
      asl  $66                          // Floating point accumulator #1: Sign
      ror  $6666                        
      ror  $00                          
      noop $6606,x                      
      jmp  ($6666)                      

      jmp  ($3C00)                      

      asl  $60                          // Scratch for numeric operation
      rts                               

      rts                               

      ror  $3C                          // BASIC precedent line number
      brk                               
      noop $6606,x                      
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $6C                          // Floating point accumulator #2: Mantissa
      brk                               
      noop $6006,x                      
      sei                               
      rts                               

      ror  $3C                          // BASIC precedent line number
      brk                               
      noop $6006,x                      
      sei                               
      rts                               

      rts                               

      rts                               

      brk                               
      noop $6006,x                      
      ror  $6666                        
      noop W2400,x                      
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $6666                        
      ror  $00                          
      noop W17FE+2,x                    
      clc                               
      clc                               
      clc                               
      noop $1E00,x                      
      brk                               
      noop $0C0C                        
      cpy  $0078                        // CHRGET (Introduce a char) subroutine
      cpx  #$06                         
      jmp  ($6C78)                      

      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      rts                               

      rts                               

      rts                               

      rts                               

      rts                               

      asl  $FC                          
      brk                               
      sed                               
      noop $D6,x                        // Cursor line number
      dec  $C6,x                        // Number of char in keyboard buffer
      dec  $C6                          // Number of char in keyboard buffer
      brk                               
      noop $6606,x                      
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      noop $6606,x                      
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $3C                          // BASIC precedent line number
      brk                               
      noop $6606,x                      
      jmp  ($6060)                      

      rts                               

      brk                               
      noop $6606,x                      
      ror  $66                          // Floating point accumulator #1: Sign
      noop $000C,x                      // Flag: default dimension for DIM
      noop $6606,x                      
      jmp  ($6666)                      

      ror  $00                          
      noop $6066,x                      
      noop $0006,x                      // Jump Vector: integer-real conversion
      noop $FE00,x                      // Routine SETLFS of KERNAL
      brk                               
      clc                               
      clc                               
      clc                               
      clc                               
      clc                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $66                          // Floating point accumulator #1: Sign
      rol  $00,x                        
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $66                          // Floating point accumulator #1: Sign
      rts                               

      noop $0018,x                      // Last transient strings address
      dec  $C6                          // Number of char in keyboard buffer
      dec  $D6,x                        // Cursor line number
      dec  $66,x                        // Floating point accumulator #1: Sign
      noop $0600,x                      // Video matrix (25*40)
      cpy  W3057+1                      
      pla                               
      cpy  $00C6                        // Number of char in keyboard buffer
      ror  $66                          // Floating point accumulator #1: Sign
      ror  $36                          // Pointer: strings for auxiliari programs
      asl  $66                          // Floating point accumulator #1: Sign
      noop $7E00,x                      
      brk                               
      noop W2018                        
      ror  $007E,x                      // CHRGET (Introduce a char) subroutine
      noop W3030,x                      
      bmi  W2D0D                        
      bmi  W2D1A+1                      
      brk                               
      noop W3010+2                      
      noop $6230,x                      
      noop $3C00,x                      
      noop $0C0C                        
      noop $3C0C                        
      brk                               
      brk                               
      clc                               
      noop W187E,x                      
      clc                               
      clc                               
      clc                               
      brk                               
      bpl  W2D2B                        
      rra  W307E+1,x                    
      bpl  W2D00                        
W2D00:
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      noop W183A+2,x                    
      brk                               
W2D0D:
      clc                               
      clc                               
      brk                               
      rla  ($66),y                      // Floating point accumulator #1: Sign
      noop $00                          // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      ror  $66                          // Floating point accumulator #1: Sign
W2D1A:
      isb  $FF66,x                      // Undocument command
      ror  $66                          // Floating point accumulator #1: Sign
      brk                               
      clc                               
      rol  $3C00,x                      
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      clc                               
      brk                               
      jam                               // Illegal instruction
      ror  $0C                          // Flag: default dimension for DIM
W2D2B:
      clc                               
      bmi  W2D93+1                      
      lsr  $00                          
      noop $3C66,x                      
      sec                               
      rra  $66                          // Floating point accumulator #1: Sign
      rla  $0600,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
      brk                               
      brk                               
      brk                               
      brk                               
      noop W3000                        
      bmi  W2D75                        
      clc                               
      noop W3000                        
      brk                               
      noop $0C0C                        
      clc                               
      bmi  W2D50                        
W2D50:
      brk                               
      ror  $3C                          // BASIC precedent line number
      isb  $663C,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      ror  W1816+2,x                    
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2D69                        
W2D69:
      brk                               
      brk                               
      ror  $000E,x                      // Data type: case 0x80=Intero, case 0x00=Reale
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2D75:
      clc                               
      clc                               
      brk                               
      brk                               
      slo  ($00,x)                      // Undocument command
      noop W3017+1                      
      rts                               

      brk                               
      noop $6606,x                      
      ror  $6676                        
      noop $0C00,x                      
      noop $6C2C                        
      noop W1C0A+2                      
      brk                               
      noop $0660,x                      // Video matrix (25*40)
W2D93:
      noop W3017+1                      
      ror  $7E00,x                      
      brk                               
      asl  $1C                          
      asl  $66                          // Floating point accumulator #1: Sign
      noop $0600,x                      // Video matrix (25*40)
      asl  $16                          // Pointer: transient strings stack
      rol  $76                          // CHRGET (Introduce a char) subroutine
      asl  $06                          // Jump Vector: integer-real conversion
      brk                               
      ror  $7C00,x                      
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      noop $6060,x                      
      jmp  ($6666)                      

      bit  $7E00                        
      brk                               
      asl  $06                          // Jump Vector: integer-real conversion
      noop $0C0C                        
      brk                               
      noop $6666,x                      
      noop $0666,x                      // Video matrix (25*40)
      noop W33FF+1,x                    
      ror  $66                          // Floating point accumulator #1: Sign
      rol  $06,x                        // Jump Vector: integer-real conversion
      asl  $3C                          // BASIC precedent line number
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2DEF                        
      clc                               
      bmi  W2E43+1                      
      bmi  W2DFE                        
      asl  $0000                        
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
W2DEF:
      brk                               
      bvs  W2E09+1                      
      noop $0C06                        
      clc                               
      bvs  W2DF8                        
W2DF8:
      noop $0666,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
W2DFE:
      clc                               
      brk                               
      noop $9D42,x                      
      lda  ($A1,x)                      // Real time clock HMS (1/60 sec)
W2E05:
      sta  $3C42,x                      
      clc                               
W2E09:
      noop $C66E,x                      
      inc  $88CC,x                      
      brk                               
      noop $C6E6,x                      
W2E13:
      noop $5EC6,x                      
      noop $3E00,x                      
      ror  $C0C0                        
      cpy  #$F8                         
      noop $F000,x                      // Undocument command
      shy  $CECE,x                      
      dec  $F85C                        
      brk                               
      ror  $E0F0,x                      
      sei                               
      rts                               

W2E2D:
      bvs  W2E6D                        
      brk                               
      noop $C0DE,x                      
      beq  W2E05                        
      cpy  #$40                         
      brk                               
      noop $C0DE,x                      
      dec  $EEC6                        
      noop $EE00,x                      // Undocument command
      dec  $C6                          // Number of char in keyboard buffer
W2E43:
      inc  $C6C6,x                      
      jam                               // Illegal instruction
      brk                               
      noop $3C3C,x                      
      clc                               
      clc                               
      clc                               
      php                               
      brk                               
      noop $0E0E                        
      noop $EC4C                        // Undocument command
      sei                               
      brk                               
      inc  $EE                          // Table of screen line/Transient editor
      sed                               
      sed                               
      pla                               
      jmp  ($0066)                      // Floating point accumulator #1: Sign

      cpy  #$E0                         
      cpx  #$60                         
      rts                               

      ror  $00FE                        // Free 0 page for user program
      noop $EE                          // Table of screen line/Transient editor
      inc  $C6D6,x                      
W2E6D:
      dec  $82                          // CHRGET (Introduce a char) subroutine
      brk                               
      jam                               // Illegal instruction
      inc  $FE,x                        // Free 0 page for user program
      dec  $C6CE,x                      
      noop $00                          // Undocument command
      noop $C6E6,x                      
      dec  $C6                          // Number of char in keyboard buffer
      inc  $007C                        // CHRGET (Introduce a char) subroutine
      noop $C6E6,x                      
      noop $60F0,x                      
      rts                               

      brk                               
      noop $C6E6,x                      
      dec  $DE                          // Table of screen line/Transient editor
      inc  $007E                        // CHRGET (Introduce a char) subroutine
      noop $C6E6,x                      
      cpy  $6CF8                        
      ror  $00                          
      noop $6076,x                      
      noop $EE06,x                      // Undocument command
      noop $7E00,x                      
      noop W1816+2,x                    
      clc                               
      clc                               
      php                               
      brk                               
      cpy  $C6CC                        
      dec  $E6                          // Table of screen line/Transient editor
      inc  $7C                          // CHRGET (Introduce a char) subroutine
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      dec  $C6                          // Number of char in keyboard buffer
      inc  W307C                        
      brk                               
      noop #$C6                         // Undocument command
      dec  $D6                          // Cursor line number
      inc  $44EE,x                      
      brk                               
      dec  $E6                          // Table of screen line/Transient editor
      noop $3C18,x                      
      ror  $C6                          // Number of char in keyboard buffer
      brk                               
      dec  $C6                          // Number of char in keyboard buffer
      inc  $3C                          // BASIC precedent line number
      clc                               
      clc                               
      bmi  W2ED0                        
W2ED0:
      inc  $0C1E,x                      
      clc                               
      sec                               
W2ED5:
      beq  W2ED5                        
      brk                               
      bpl  W2F10+2                      
      noop $38FE,x                      
      sec                               
      sec                               
      sec                               
      sec                               
      sec                               
      sec                               
      sec                               
      inc  $387C,x                      
      bpl  W2EF9                        
      bmi  W2F6A                        
W2EEB:
      isb  W307E+1,x                    
      bpl  W2EF0                        
W2EF0:
      sed                               
      beq  W2EEB                        
      noop $1EBE,x                      
      noop $0000                        // Undocument command
W2EF9:
      noop $BE1E                        // BASIC ROM
      noop $F0F8,x                      // Undocument command
      sed                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      php                               
      noop $FFFE                        // Masckerable Interrupt (IRQ) vector
      inc  W080C,x                      
      brk                               
W2F10:
      slo  $1F0F,x                      
      rla  $787D,x                      
      bmi  W2F18                        
W2F18:
      brk                               
      bmi  W2F93                        
      adc  $1F3F,x                      
      slo  $001F                        // Undocument command
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      jam                               // Illegal instruction
      ror  $0C                          // Flag: default dimension for DIM
      clc                               
      bmi  W2F93+1                      
      lsr  $00                          
      noop $3C66,x                      
      sec                               
      rra  $66                          // Floating point accumulator #1: Sign
      rla  $0600,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
      brk                               
      brk                               
      brk                               
      brk                               
      noop W3017+1                      
      bmi  W2F75                        
      clc                               
      noop W3000                        
      clc                               
      noop $0C0C                        
      clc                               
      bmi  W2F50                        
W2F50:
      brk                               
      ror  $3C                          // BASIC precedent line number
      isb  $663C,x                      
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      ror  W1816+2,x                    
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2F69                        
W2F69:
      brk                               
W2F6A:
      rla  $007E,x                      // CHRGET (Introduce a char) subroutine
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
      brk                               
W2F75:
      clc                               
      clc                               
      brk                               
      brk                               
      slo  ($06,x)                      // Jump Vector: integer-real conversion
      noop W3017+1                      
      rts                               

      brk                               
      noop $CEE6,x                      
      dec  $E6,x                        // Table of screen line/Transient editor
      inc  $007C                        // CHRGET (Introduce a char) subroutine
      clc                               
      sec                               
      sec                               
      clc                               
      clc                               
      clc                               
      php                               
      brk                               
      noop $06CE,x                      // Video matrix (25*40)
W2F93:
      noop $E670,x                      // Undocument command
      inc  $FC00,x                      
      inc  W1C04+2                      
      asl  $CE                          // Char under the cursor
      noop W07FE+2,x                    
      noop $CC6C,x                      
      cpy  $0CFE                        
      brk                               
      ror  $DCC0,x                      
      ror  $0E06,x                      
      noop $3C00,x                      
      bvs  W3013                        
      cpx  $E6C6                        
      noop $7E00,x                      
      inc  W180A+2                      
      clc                               
      sec                               
      bmi  W2FC0                        
W2FC0:
      noop $E6C6,x                      // Undocument command
      noop $C6CE,x                      
      noop $7C00,x                      
      dec  $6EC6                        
      noop $781C                        
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      brk                               
      brk                               
      clc                               
      brk                               
      brk                               
      clc                               
      clc                               
      bmi  W2FEF                        
      clc                               
      bmi  W3043+1                      
      bmi  W2FFE                        
      asl  $0000                        
      brk                               
      ror  $7E00,x                      
      brk                               
      brk                               
W2FEF:
      brk                               
      bvs  W3009+1                      
      noop $0C06                        
      clc                               
      bvs  W2FF8                        
W2FF8:
      noop $0666,x                      // Video matrix (25*40)
      noop $0018                        // Last transient strings address
W2FFE:
      clc                               
      brk                               
W3000:
      ora  $06,x                        // Jump Vector: integer-real conversion
      noop $01,x                        // 6510 I/O register
      anc  #$20                         // Unusual operation
      asl                               
      ora  $20                          // Transient strings stack
W3009:
      ora  $0615                        // Video matrix (25*40)
      noop $01,x                        // 6510 I/O register
      anc  #$20                         // Unusual operation
W3010:
      jsr  $0C20                        
W3013:
      ora  ($0D,x)                      // Data type: case 0xFF=Stringa, case 0x00=Numerico
      ora  $13                          // Flag: INPUT request
W3017:
      slo  ($12,x)                      // Flag: TAN/Result symbol of one comparison
      slo  $0C0C                        
      slo  $07                          // Search char
      noop $05                          // Jump Vector: integer-real conversion
      jsr  $0101                        // CPU stack/Tape error/Floating conversion area
      jam                               // Illegal instruction
      ora  $14,x                        // Transient: integer value
      slo  $0510                        // Video matrix (25*40)
      jam                               // Illegal instruction
      ora  W2004,y                      
      asl  $0503                        // Video matrix (25*40)
W3030:
      noop $14,x                        // Transient: integer value
      anc  #$13                         // Unusual operation
      ora  $0E                          // Data type: case 0x80=Intero, case 0x00=Reale
      ora  ($14,x)                      // Transient: integer value
      slo  $0617                        // Video matrix (25*40)
      ora  #$06                         
      asl                               
      anc  #$01                         // Unusual operation
      jsr  W1916                        
W3043:
      slo  ($01),y                      // 6510 I/O register
      asl                               
      noop                              // Undocument command
      ora  $0A,x                        // Flag: 0=LOAD, 1=VERIFY
      ora  $05,x                        // Jump Vector: integer-real conversion
      slo  ($14),y                      // Transient: integer value
      ora  $08                          // Flag: search the quotation marks at the end of one string
      slo  $0F0F                        
      slo  $0E04                        
      ora  $0B                          // Buffer pointer of input/number index
W3057:
      slo  $050E                        // Video matrix (25*40)
      slo  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
W307C:
      ora  ($01,x)                      // 6510 I/O register
W307E:
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
      ora  ($01,x)                      // 6510 I/O register
W3100:
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      php                               
      slo  W1A0E                        
      ora  ($20,x)                      // Transient strings stack
      slo  $0607                        // Video matrix (25*40)
      jsr  $0F08                        
      asl  $0104                        // CPU stack/Tape error/Floating conversion area
      asl  W2009                        
      asl                               
      jam                               // Illegal instruction
      jsr  $0C01                        
      ora  $20                          // Transient strings stack
      asl  $05,x                        // Jump Vector: integer-real conversion
      noop $010B                        // CPU stack/Tape error
      jsr  $0A07                        
      ora  ($20,x)                      // Transient strings stack
      asl  W2001                        
      slo  ($16),y                      // Pointer: transient strings stack
      ora  $14                          // Transient: integer value
      ora  $20                          // Transient strings stack
W3130:
      slo  $0608                        // Video matrix (25*40)
      asl  $06                          // Jump Vector: integer-real conversion
      slo  $0F                          // Flag for DATA/LIST
      php                               
      noop $06                          // Jump Vector: integer-real conversion
      slo  $0608                        // Video matrix (25*40)
      noop $02                          // Undocument command
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
W3200:
      slo  ($02,x)                      // Undocument command
      jam                               // Illegal instruction
      ora  $0D,x                        // Data type: case 0xFF=Stringa, case 0x00=Numerico
      ora  W1A1A                        
      noop                              // Undocument command
      ora  $15,x                        // Transient: integer value
      ora  $15,x                        // Transient: integer value
      ora  $07,x                        // Search char
      asl  $20,x                        // Transient strings stack
      asl  $0820                        
      slo  W1A0E                        
      ora  ($20,x)                      // Transient strings stack
      php                               
      slo  W1A0E                        
      ora  ($20,x)                      // Transient strings stack
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      ora  $12                          // Flag: TAN/Result symbol of one comparison
      slo  $06                          // Jump Vector: integer-real conversion
      php                               
      slo  $17                          // Last transient strings address
      jam                               // Illegal instruction
      php                               
      slo  $12,x                        // Flag: TAN/Result symbol of one comparison
      noop $08,x                        // Flag: search the quotation marks at the end of one string
      noop $11,x                        // Flag: case 0x00=INPUT, case 0x40=GET, case 0x98=READ
      slo  $14                          // Transient: integer value
      jam                               // Illegal instruction
      asl  $07,x                        // Search char
      jam                               // Illegal instruction
      noop $12,x                        // Flag: TAN/Result symbol of one comparison
      clc                               
      asl  $04                          // Jump Vector: real-integer conversion
      asl  $03,x                        // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      jam                               // Illegal instruction
      noop $07,x                        // Search char
      jam                               // Illegal instruction
      slo  $12                          // Flag: TAN/Result symbol of one comparison
      clc                               
      noop $02,x                        // Undocument command
      clc                               
      noop $12                          // Flag: TAN/Result symbol of one comparison
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      asl  $03                          // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
      slo  ($03,x)                      // Jump Vector: real-integer conversion
W32FF:
      slo  ($15,x)                      // Transient: integer value
      asl  $14                          // Transient: integer value
      jam                               // Illegal instruction
      ora  ($10),y                      // Flag: Index/Call reference of user function
      slo  W1509                        
      ora  W1212+2,y                    
      jsr  W1212                        
      noop $06,x                        // Jump Vector: integer-real conversion
      noop $20                          // Transient strings stack
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      php                               
W3317:
      anc  #$0A                         // Unusual operation
      php                               
      slo  $08                          // Flag: search the quotation marks at the end of one string
      slo  $07                          // Search char
      noop                              // Undocument command
      anc  #$08                         // Unusual operation
      ora  $0D,x                        // Data type: case 0xFF=Stringa, case 0x00=Numerico
      ora  $13,x                        // Flag: INPUT request
      jsr  $050A                        // Video matrix (25*40)
      noop $05                          // Jump Vector: integer-real conversion
      asl  $0B20                        
      slo  $030E                        // 6502 Y register memorization
      ora  #$0D                         
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $06                          // Jump Vector: integer-real conversion
      php                               
      anc  #$0A                         // Unusual operation
      asl  $07                          // Search char
      php                               
      slo  $06                          // Jump Vector: integer-real conversion
      ora  $0F                          // Flag for DATA/LIST
      ora  #$0F                         
      anc  #$3A                         // Unusual operation
      anc  #$04                         // Unusual operation
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      anc  #$0A                         // Unusual operation
      anc  #$0A                         // Unusual operation
      asl                               
      anc  #$0A                         // Unusual operation
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
      noop $04                          // Jump Vector: real-integer conversion
W33FF:
      noop $15                          // Transient: integer value
      ora  ($01,x)                      // 6510 I/O register
      ora  $1A,x                        
      noop                              // Undocument command
      ora  ($13,x)                      // Flag: INPUT request
      ora  $08                          // Flag: search the quotation marks at the end of one string
      ora  $04                          // Jump Vector: real-integer conversion
      ora  $0E                          // Data type: case 0x80=Intero, case 0x00=Reale
      slo  W1002+2                      
      slo  $0E12                        
      ora  $0A                          // Flag: 0=LOAD, 1=VERIFY
      bpl  W3429+2                      
      clc                               
      slo  $06                          // Jump Vector: integer-real conversion
      slo  $06                          // Jump Vector: integer-real conversion
      asl  $15,x                        // Transient: integer value
W341F:
      ora  $03                          // Jump Vector: real-integer conversion
      ora  #$06                         
      jam                               // Illegal instruction
      asl  $02                          
      ora  $0908,y                      
W3429:
      asl  W1801+2                      
      ora  ($05,x)                      // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $0B                          // Buffer pointer of input/number index
      php                               
      php                               
      anc  #$08                         // Unusual operation
      anc  #$08                         // Unusual operation
      php                               
      anc  #$08                         // Unusual operation
      slo  $08                          // Flag: search the quotation marks at the end of one string
      anc  #$08                         // Unusual operation
      slo  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      noop $14                          // Transient: integer value
      slo  $0C0F                        
      anc  #$13                         // Unusual operation
      ora  $17                          // Last transient strings address
      jam                               // Illegal instruction
      noop $07,x                        // Search char
      slo  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
      ora  $05                          // Jump Vector: integer-real conversion
W34FF:
      ora  $0B                          // Buffer pointer of input/number index
      noop                              // Undocument command
      noop $0A07                        
      noop $0C3A                        
      asl                               
      php                               
      slo  $0B                          // Buffer pointer of input/number index
      php                               
      slo  $02                          // Undocument command
      asl  $0B02                        
      asl                               
      asl  $0B                          // Buffer pointer of input/number index
      php                               
      asl                               
      jam                               // Illegal instruction
      jam                               // Illegal instruction
      asl                               
      jsr  $0620                        // Video matrix (25*40)
      clc                               
      jam                               // Illegal instruction
      clc                               
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      php                               
      slo  ($08),y                      // Flag: search the quotation marks at the end of one string
      slo  $08                          // Flag: search the quotation marks at the end of one string
      anc  #$08                         // Unusual operation
      asl  $0A                          // Flag: 0=LOAD, 1=VERIFY
      asl                               
      php                               
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $0B                          // Buffer pointer of input/number index
      asl                               
      asl                               
      asl                               
      anc  #$0A                         // Unusual operation
      php                               
      asl                               
      asl                               
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      php                               
      asl                               
      php                               
      php                               
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
      asl  $06                          // Jump Vector: integer-real conversion
W35FF:
      asl  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      noop $06                          // Jump Vector: integer-real conversion
      anc  #$04                         // Unusual operation
      asl                               
      asl                               
      anc  #$0A                         // Unusual operation
      asl                               
      php                               
      slo  $07                          // Search char
      lsr                               
      asr  #$4A                         // Unusual operation
      pha                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
W363D:
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      lsr                               
      pha                               
      slo  $07                          // Search char
      slo  $0A                          // Flag: 0=LOAD, 1=VERIFY
      asl                               
      php                               
      asl  $0A                          // Flag: 0=LOAD, 1=VERIFY
      php                               
      php                               
      asl  $08                          // Flag: search the quotation marks at the end of one string
      asl                               
      anc  #$0A                         // Unusual operation
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      lsr                               
      slo  $0A                          // Flag: 0=LOAD, 1=VERIFY
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      lsr                               
      slo  $07                          // Search char
      asl                               
      asl                               
      asl                               
      asl                               
      php                               
      slo  $07                          // Search char
      php                               
      asl                               
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      php                               
      asl                               
      php                               
      asl                               
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      asl                               
      php                               
      slo  $07                          // Search char
      slo  $0A                          // Flag: 0=LOAD, 1=VERIFY
      anc  #$0A                         // Unusual operation
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      asl                               
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      asl                               
      php                               
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $07                          // Search char
      slo  $??                          // Undocument command
