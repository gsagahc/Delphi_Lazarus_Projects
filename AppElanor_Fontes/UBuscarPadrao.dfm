object FrmBuscarCheque: TFrmBuscarCheque
  Left = 267
  Top = 231
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 251
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 98
    Width = 605
    Height = 153
    Align = alBottom
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 603
      Height = 151
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DSCheque
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TBCH_NUMCH'
          Title.Caption = 'N'#250'mero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBCH_NUMPED'
          Title.Caption = 'Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBCH_VALCH'
          Title.Caption = 'Valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBCH_BOMPARA'
          Title.Caption = 'Pr'#233'-datado para'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 97
    Align = alTop
    TabOrder = 1
    object PNGButton2: TPNGButton
      Left = 528
      Top = 12
      Width = 57
      Height = 65
      ButtonLayout = pbsImageAbove
      Caption = 'Voltar'
      ImageNormal.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F4000000097048597300002E2300002E230178A53F7600000AD54944415478DA
        7D570B54955516DEE7FCF7722F97375C41858BBC04CB47566A938F5109B3296A
        B91C5FB96C566FD0E5ABC4B1B4B2C6A995E6F235C452734DD3AAA955A361B8A4
        211C0DA985AFC414354110D40041C07B81FB80FF9C337BFF97EB206BEC5FEBE7
        5CFEF3D8DFFECE77F6DE87BDFDF6DBD0FF514A01630CA49420856036B339282C
        22A2B7D36C9657BBBAA0E1F265E02E17386B6B437CF5F5E1385E9993939DD169
        691E4B5C1C242426C2D0E060B079BD2697CBA57975DDA7994CC69A81B5FB3F2C
        00803A8D0F38400801419AC62D56AB6CF178A0E6C20510555563539B9A3287EB
        FA84E4D0D0D4A8F0F09850B3D98CB354A7CFD7DBEE72B5D47BBD35BF582C158D
        8989FF318F1C599D929A0A31160B73BBDD4C0248CEF91D766E030820A3963C0F
        B5D978ABDB2D4F9E38C1A22B2A9ECEEEEE7E79DAC8910F274F9912C4C68E0548
        4A02888800309BFD6EF4F400747400D4D682387D1A2E97977797D4D4941DB6DB
        0B4466E6C1B1A34641285A77FB7C922108D68F69B67EFDFADBC6F10F848484B0
        1FCF9D538DFBF74F5DDCD5B5696156D604CBA24500F7DF0F101A2A705B00749D
        F688A8F203408A817385ADE2E499D3A9C1F1E3D0F9C927B0E7F8F1439FC6C5AD
        4ACFCE3EFB405A1AEFF678A46138B025B719C0752C48D7DE9212155F56B6363F
        21618363C50A0E9999BA6088DBE3A11964888032864C81CDE607E07683A2EFD8
        03F41D0109DC3E133173E080762E3FBF7BF1AD5BCB4366CFFE7BE6F8F1DCDD07
        C2D802628000045BADFCF3A22239FAD8B1ADFF18376EA579D52AA927272BADB3
        53636452D3C83863BAEEF798B6213EDE0FA0B111E0CA1580DE5E30C649A918B2
        83A098080B13A6B36735E7E6CD30A7BAFACFCE69D33E98FFF8E3DCD9D929351C
        CBD6AE5D0B2828ADE8C811115452B2EEDB071EF8AB392FAF57D8ED260DC5A348
        679CFBF192F1418300EEBD17202CEC0E35436727404D0D80C301101404243556
        53A3A0A181E99191D25457273B366E34CDA8AD7D66E8FCF99F4D1E3B96BBBABA
        24DBB26993F9ECE5CBBDDFEDDE3DF14442C20FF1797942242773CDE3E1649C69
        48007A468B1A8651D9C00C4EEE0430E07819FB71E60CC0C58B0A3790E9369B34
        5556C2A92D5BDC33BCDE31CF2F5F7E252A3494B30FB76FD7DECFCF67CB6A6BCB
        56BFF0C2443D2B4BA0710D0D2A5C92195E93572442527EC0707F1081DF819674
        409AA8A800B8740994D5AAC0E763C262D14D5F7F6D5AB277EF3F8F8C1BB768C5
        33CF98D994EC6CB871F0E0A3473332FE3D282747A1D2199D5743E92121000F3E
        089091E15F9C16A6B6BF417F10B91350E0FFAB57018E1E0585224526159D19D6
        D2A22E141478A7DFB831FEB9BCBC0B0CC2C3E105B7BB604F7676AE9A3143E0D1
        32190B10D59326014446021B68F82E940F08A9A0680C464DF8E107BF3EFC7384
        FAE61B6DC6E1C36BDAA74FDF449FB482A8A8A339F3E73F2C333224ED3D7ACDE4
        238F1813585FD45201CF06ECB9D18700E9BDDD452781E65238EF9BC78F1C018C
        0D4ADA6C82FDF493B666DFBE7D5B959A4BABC4ED8D8FFF7EF6AC5923645292E4
        6E37F7A0711B793F203F0CF410FA80B1DF6020D0E73D79122CC5C520AD56C12F
        5ED4F28B8A7E5CDED13199FA1D8529298766A5A7A7EB76BBD01C0EAD1EE37FDB
        983180090692264E048E1EE13900E7CD9B60443F8C03513131C0FB8075343541
        53551518A108C70E9B3001ACA41FEC6F3871025A2F5E04FBD9B390847DE2EA55
        69EAE8E03BCF9F3FB6B8A9E9610290589891F1DDACE1C33374A5A4867980E1BE
        5F6F69811E0C36491840C8E0F9D5ABA16BCF1EB08486424F7737842D5902F76C
        D860787966F66C082E2C04CA0CDD14513FF80046AC5AE507F0DA6BC0D1B863F0
        60430FC2E3111A63DACEAAAA8A25D7AE4D3418F83C2DAD74C198311998AE8416
        1CAC614C06B05A01525200962D031D01B8B3B2201C6934C4D9D000ED0F3D0411
        442931337326D84B4BFD73BC5E6879F34D887DE71D4AE7C03FFC1000B3A991B0
        B04F78BD920BC1B79F3A55F14A63A30120F16F4386942E9D3A35DD4899C880C2
        7C4EE7580D1B066CE54A83567DFF7EC313863141353783C2ACA83DF618609E80
        9B7894630F1EA46405026B86B6BFFC05062308439C3B7600C35810C819800CA0
        38B575A5A5C7DE73B98C2D885E6932956E9E33E77E6EB148F482437030232513
        0058BAF4B6000382BB2D3C0C52C44EDB9C39107BE000B0D858D0510F6DB83571
        AFBF6E30C076ED32001860DC6E85B944786FDDD29E2D2A2AF98AF33F30F22E4B
        887F7D3479F21F878D1F2F709089636C5054C52000F5E28B7706A1014AD7717E
        1BA6EBB8F27200BB1D0402B8F9CA2B109797078AB60053B2FAE517603856DCBA
        055A78B83873E890F67C55D5D64A805719474309422CDB68B1EC58B07CB994BD
        BD8C61DC67C882C0124BCBCDFDED78836F07521EFDFDF7C8653448146F07B216
        336F9ED12F3EFA08B4FA7A505EAF1145B085FC9D3BC55B52CE8B1C36AC90A5A1
        A8AED4D58D5CAA54F1AAD1A3131C68505CBBC67944847263DEBF3274280CC2A3
        1884D58F4601A58F7EDE57C0102B124F856A6B3352B14E9E0E196268A3158FA0
        03236038634A6266D5860C11E7B76EE51B1A1A4E7F09F0D49F162E6C64792B56
        C0B6DDBB83D2BDDE75EF2AF5D6234F3EA9873DFDB42650E91A8AAAA9B59535E3
        F1B1E16F33B265C613622230B445FEE20424194550BDA8741DDF1E149B07C518
        8B624E1834480964554B4C543777ED1245478F9ADE606CB1273A7AF71B6BD628
        B66DDB36F6E5175F40C5F1E329B99C7FF69294BF1BB160816E5BB4C8243B3A94
        115C22239991FF118491A0E8A56A886A42D206D20AC802A051A3A597EA03A753
        C9A020C6C3C294138D5716179BB6735EB45FCA9CA7B2B39BA74C9DEA2FC948AD
        0505059AABAD6DDA7B8CED99AD5452EC134FE821B9B99A8C8A621840FC210F0D
        3302120043C79522639F414546E945B51BE91881F31B379473C70E71ADACCCF4
        09E7959BA57CC9111F7FFAE5DC5C948317D8BA75EB709D6068FCF55728D8B9D3
        6253EAB1F701362EC4241C3C7AB4343FF71C6893273386B5807104A9AAB55A99
        C1003141F5429FE7AAA747196310AC42EFC5E1C3D2FBF1C7BCBDBA9AED62ECE4
        FB4AADC652FFC79C9C1C8CFA768C4D3D7E06E81E80D5309CC04AF6EBC242740B
        26BECA58DEEB08C61E1505307DBAEA9D3953F1FBEE033E783033BCA7684959CF
        90BA30EA410282C750C1A953CA545CCCB11660359D9DBD1B382FFC54CA2DD6E0
        E0CAE79F7DB62701839907F38D511306CA72BA0F1013973068ECDDB7CFDCD5D9
        99761F6373D72B35FFC9F0F07B4DE9E90098A0006B7C959EAE248A0A30F01820
        F0E8F1FA7AC62E607D81651760C8EEAAA9D1BF00A87C17E0F3068022F4F8EABC
        B9737507DE9CF0A2621837B26C0080DF1181CCDA503B4E28F9F65B56F9F3CF58
        83C1C8516673E6BCE8E8DF3F3A74E83D231C8ED888840433608C30982011B6B7
        1B95717B4383AFEAFAF5E683ADADE7BE72B9CAEA953A82962E4D9E30A16B3AE6
        122CFBB132F3FDCF38A5EBC0BD20505C1013263C62F4D6E13DB0BCBC9C5FAAAD
        0DC30E4C67901A6336A72645443892ECF6181B5D2470BCD3EDF6D4B7B7B7D6BB
        5CD79C42D4E2B83AB47663FCA8515D93264D5271181768BFC9C1C0F5EC8EABD9
        C0C2835A7AAD98DDA86D6B6D859AEA6AA8ABAFD7AE373707B9BABB2DCAE70BA2
        ECDF3755A0307D112121BEA4F8F89E94E464993A7C38C4A0D07414A921B6FEB7
        A17E219DDDED764C8FEC2BB3F00E6A30427D3D4821051CDAA6FE7322B1863063
        080F429A697E2F8A925EFAFDFF2EA57705703736080CB5B818A33D34072EA67D
        0F19238A25DD8AFA8CFE96E1C0F35F6C707C5ECB277D510000000049454E44AE
        426082}
      ButtonStyle = pbsDefault
      OnClick = PNGButton2Click
    end
    object PNGButton6: TPNGButton
      Left = 464
      Top = 12
      Width = 57
      Height = 65
      ButtonLayout = pbsImageAbove
      Caption = 'Localizar'
      ImageNormal.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F4000000097048597300002E2300002E230178A53F76000009224944415478DA
        9D570B4C54E9153EF7DE79318008883CCBFA2A28B8D81A6334B1F681C65A916E
        7CD4C02EDAEA92D018D780CAFA181A6128627DA2A4C6286D4D5DC5D0D552F1D1
        95EDD656538568525DA501B182BCE4256F06E6CEBDFDCE5F66021577496FF267
        66EEBDFF39DFF9CE77CEF9473A70E080A9B5B575B8AFAF6FD9E1C387AF6B9A26
        4B92C44BA2095CBAAEF387663018A4BABABA673B77EE9CBB78F1E261DC535CB8
        BECE8C74F0E041CBCB972F1D5E5E5EBB7E856B6868485514C53011FF23CEF953
        0770CDE9744A57AE5CF914EBFDF9F3E7BB5455E517C44B6FB327C1A705C81DDE
        DEDE590093E370389C465C1371CE4B966542A004E77A7F7F3F476CB888ABA2A2
        2279EEDCB9D2E0E0A0CEEFF0BBE3816000E6FAFAFA2130B00FDF7327CA000216
        0679B173442B757777EB269349C5332330FCEEF1E3C73F9B3973A6049B6F0521
        18000087C562B11D3A74C8CE00904FC344E96783C3C3C3CC82DED6D626F9FBFB
        EB08C6095D998A8B8B7F535555B565D6AC596F05E10160369B6D10E18401B819
        E00BD18BF5EAD52BDDCFCF4F0A0C0CD40706069C1D1D1DA6F3E7CF173D7BF6EC
        438020D8A6FF05F17F0318CD003B671D40CCC4CEA74C99C2D6392D2A98309E3B
        77EE2C40A4221D82AD711940EE6C478E1C993080D12C301806D1D9D9C92C1052
        C0E8246849073015368D252525457896366DDA34511D6F3000E1DB8E1E3D6A47
        157C2500DEC88E4733C0B47264BCA07A02FDFC5DE7B26426C0AEDAD5D565DCBF
        7FFFF7162C58701BEF739FD13C00B80C990106F0750CB0737E3C3AFF7C0FFBC5
        F7DEDEDED1CCE80848E254E09EB467CF9E3548C39FF0AE82ADAE310CC0A8EDD8
        B1635FC90047CD2DA2A9A9891E3D7A4453A74E25D4BA705E5B5B2B0044454511
        CA919E3C7922D2111313A30707076BB82767666626E27919CC8F65803B2158B1
        1D3F7EDC0E0AC705E08EFCE9D3A7B46BD72E42EB16C2DBB2650B454444D0AD5B
        B744F46BD6AC21304A101E4103E4E3E343797979AE193366287877F5ECD9B3CB
        10C49B0CE0E571018C1619C44519191974EFDE3D42AB15A0162E5C480D0D0D42
        80283B82030A0A0A12EFA0B7D083070F68C992252A7A8C01E012E7CC9973158C
        C9DCBD4523E35900030EFCB01514147852E0AE5577CB659AB9CC50D78466239C
        B3D391FA17BF997A7E8632F444CF294350AE75EBD629369B6D557474F475D855
        B05CC2873B056E0050B007803BEFECFCC58B17545A5A2A14CF2A6F6F6F1700D8
        D1EBD7AF050806CCD133084E8FD56A1560D09C547C579096F7E3E2E22EA21415
        88DDC5B63C0CC097EDC48913760C943100F825B042A74F9F160CB061BC23CA0D
        65267EA3C44409F21E941C3B14C038939C362C5748488852535353F9F0E1C3EF
        6CDAB46988F78F0B00E2F200E0C506EEDEBD4BA74E9D1211B12316604F4F8F00
        C2E038F78B162D128039F7E886020826AC00834F1DA9D0A109B9ACACEC478989
        893750193202D0A4FCFC7C4B6363A303CE6C274F9EB443C90200E7942F1612EE
        D3EDDBB78573A6DA1D2DF7766681CB32353555E8A0A8A888C2C2C244F40C82A3
        E420264F9EAC8686862A95959545A89AD4F8F8781941681E06180033809B1E06
        D8080B2B3D3D9DAAABAB45341091D003A8145A60A7CC446161A148C7F6EDDB85
        F8580FCC18570B7EEB00C97D89A3AE47CA6290867EA441F20080211B8CD8F150
        006063BEBEBE545E5E2E4A6FFAF4E904DA44D9714A2E5DBA2418621698256688
        F72032A10FBEC717D44F919191DCA874A44E07DB3202589E9292528E4666F000
        C06601008AF6A460D2A4499496964698E9C2083BE04E071AE9E6CD9B141E1E2E
        C4B67EFD7ADABD7BB7480BEC11068F6086FBC3CA952B09B52F58830E54B0A5DC
        B871A32821212175E9D2A5660F00D4B30080F2F29C88D8786E6E2E3D7FFE5C44
        151810400158ECBCBAA646945C56569600C0F5CE005813380D092018C5140DC0
        2B56ACE092D5DBDADBB4E0E01019000BD0A2D3C1C25806580338D57834C0462F
        5CB840FFB87B874C162F8A441A18544971313DC62C30E0F999336768EDDAB542
        0FEEAAE13DDBB66D23CC627A77DE3C5ABBFE27A4BA54FD456DADCB6A312B7FBB
        73F700D8DD979494641CC30003006AC1003B47BE4434CF1A1AA9B3E125593517
        F10C7CED42A446037D595141193B7688D9C0738001B000ED763B9D3D7B86A2E2
        BE455659A20093815C60A6D7A56BA151B3E540ABB9F3DAB5EBF350390D630070
        277403E012BA7FFF3EEDCEFA054DABABA2045F2B8558BD48329AE85F75F5F4B9
        C58F6A02822971793CEDDD6713A5C9173364CFC9A1F2BFDFA185268D565B5C14
        E98B7D06ECFBF29F74BE7940D37E9020B735D46F7C372EEEF71E00C8DD180056
        A878FB5E1B759DFF359D5E104E66CD8003BE42324A4B770C53CDE36ADA6B0CA0
        D88DA9B437239D5C237D83C052565E3EF57EF6472A8CF2A3203338B398B0BC31
        FF86E875ED43756B83592957A7FC362A22648B070022102940A351D1FB0D9CBF
        840DC9F4F1D0435A37DD9F3ABA86C9082392D9426AFF20F9B5B4506197912A96
        255141CE7E728E9C9230E6286DD7C79454FD396DF866202AC74132FA0799BD48
        750CE8466AD54A9B34F9BDBFF47CF1DDF9B1F1DC09CDC835CA79681F18C86D69
        6951C5BCC6B4DCF4F38F28B8AA9C3EF9E9F7C9D933408EDE2E225069D62432E9
        0A6DFA73159913522827738700206687AED1CEEC5F52E8FDAB74F4836544C368
        568E1E00B0E8B20974185DEA07172A95CBFF765CFD76F48C1F7BFE9A7123C2A1
        341BDF198010E145A8DD9E778052A2FD2973E37B14F18D50925427B5D637D2E1
        4FAE5169B799327764D0AA55AB44F9F16580063EBD7C994EA033A6849BE8A3B4
        149A1C1ACC73956A6B9EEBF94525CAAD568D5A1BEB3F8C89892D120C3437370F
        81FA3D98F5793C68FE7B109151BB1DA2CC4A4ACBC830D84DEF840591025537B5
        7692CB670AADFEE172DA801E101018289A14371FEEFDCD980D97D08C3EFBE2AF
        64C5BEA961A1E4545D54D7D842AAD1AAF675B615B67774646DDDBAB54FCACECE
        96917F0DD32E0EC7A6ED28236EC3E258CD40505E86AECE8E40C5640E9564831F
        9F671559EE1D1EEC6F327B59DB7D7C7D9DFA08FDEE093AB2CFA43A8783CC569F
        309CC3BD014EC5F1A6EA5573F3E50187E30FC9C9C93DB1B1B124712763BAB9DD
        F241924F38A30FA13C90705F868130DC0AE034732BC06A448BE5A6F5C6DF2D66
        810714FE8CF09FDC08ACC93C36B0EA30D0FA376FDE2CE60A0FBAFF0058CF440D
        952968310000000049454E44AE426082}
      ButtonStyle = pbsDefault
    end
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 108
      Height = 13
      Caption = 'N'#250'mero do cheque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 104
      Height = 13
      Caption = 'N'#250'mero do pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 24
      Top = 24
      Width = 409
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 24
      Top = 64
      Width = 409
      Height = 21
      TabOrder = 1
    end
  end
  object IBQCheque: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  ID_CHEQUE,'
      '               TBCH_NUMCH,'
      '               TBCH_VALCH,'
      '               TBCH_NUMPED,'
      '               TBCH_BOMPARA'
      'FROM  TB_CHEQUES'
      'WHERE TBCH_NUMCH=:pNumCheque'
      'OR TBCH_NUMPED=:pNumPed')
    Left = 304
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pNumCheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pNumPed'
        ParamType = ptUnknown
      end>
    object IBQChequeID_CHEQUE: TIntegerField
      FieldName = 'ID_CHEQUE'
      Origin = 'TB_CHEQUES.ID_CHEQUE'
    end
    object IBQChequeTBCH_NUMCH: TIBStringField
      FieldName = 'TBCH_NUMCH'
      Origin = 'TB_CHEQUES.TBCH_NUMCH'
      Size = 12
    end
    object IBQChequeTBCH_VALCH: TIBBCDField
      FieldName = 'TBCH_VALCH'
      Origin = 'TB_CHEQUES.TBCH_VALCH'
      currency = True
      Precision = 9
      Size = 2
    end
    object IBQChequeTBCH_NUMPED: TIntegerField
      FieldName = 'TBCH_NUMPED'
      Origin = 'TB_CHEQUES.TBCH_NUMPED'
    end
    object IBQChequeTBCH_BOMPARA: TDateField
      FieldName = 'TBCH_BOMPARA'
      Origin = 'TB_CHEQUES.TBCH_BOMPARA'
    end
  end
  object DSCheque: TDataSource
    DataSet = IBQCheque
    Left = 304
    Top = 98
  end
end
