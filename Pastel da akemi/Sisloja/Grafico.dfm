?
 TFRMGRAFEVOL 0{  TPF0?TfrmgrafevolfrmgrafevolLeftbTop? BorderIconsbiSystemMenu Caption    Gráfico de Evolução de VendasClientHeight?ClientWidth3ColorclWindowCtl3D	Icon.Data
?             ?     (       @         ?                        ?  ?   ?? ?   ? ? ??  ??? ???   ?  ?   ?? ?   ? ? ??  ???                                    ;;;33  ?;0    ????333?03   30     0?;30  3;???303??330   333333;;?;;;   ;;333;3???3  ?????33;3;?3; 30     ;3????   ;;33;3;??;  0?????3;3;??? 33333333;?;;   ?????333;?   33     ?;33?0  0 ??????33?    ;;;;;;?;;?    3333333033     0 ??8880 0      33?            38 ;;;;;       0????????0      3????3333      ??????        33;??;;30      3???????3       3;;???330        ?????                                                                     ????? <?  ?  ?  ?  ?  ?  ?              ?  ?  ?  ?  ?  ?  ??  ??  ?  ??  ?  ?  ?  ?  ??  ???????????????
KeyPreview	PositionpoDesktopCenterOnClose	FormClose
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight ?TPanelPanel1Width3Heightr TLabelLabel1Left`TopIWidth&HeightCaptionData deFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2Left? TopIWidthHeightCaption   AtéFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBChartDBChart1Left8TopWidth?Height1AllowPanningpmNone	AllowZoomBackWall.Brush.ColorclWhiteLeftWall.Brush.ColorclWhiteLeftWall.Brush.StylebsClearMarginBottom
MarginLeftMarginRight	MarginTop Title.Font.CharsetANSI_CHARSETTitle.Font.ColorclBlueTitle.Font.Height?Title.Font.NameTimes New RomanTitle.Font.StylefsBold Title.Text.Strings    Evolução de Vendas no Período AxisVisibleBottomAxis.Title.CaptionDataLeftAxis.LabelsAngleZLeftAxis.LabelsSeparationLeftAxis.LabelsSizeLeftAxis.Title.Angle LeftAxis.Title.CaptionVendasLeftAxis.VisibleLegend.AlignmentlaBottomLegend.ColorWidthLegend.Inverted	Legend.TextStyleltsPlainLegend.TopPosLegend.VertMargin(View3DView3DOptions.Elevation;View3DOptions.OrthogonalView3DOptions.Perspective View3DOptions.Rotationh
BevelInner	bvLowered
BevelOuterbvNoneTabOrder  THorizBarSeriesSeries1ColorEachPoint	Marks.ArrowLengthMarks.Frame.VisibleMarks.Style
smsPercentMarks.Transparent	Marks.Visible	
DataSource	qryvendasSeriesColorclRedTitleVendas
UseYOriginYOrigin       ?@XValues.DateTime	XValues.NameBarXValues.Multiplier       ???XValues.OrderloNoneXValues.ValueSourceTOTVENDAYValues.DateTime	YValues.NameYYValues.Multiplier       ???YValues.OrderloAscendingYValues.ValueSourceVENDEDOR   	TMaskEdit	meddatadeLeft? TopGWidth9HeightEditMask99/99/99;1;_	MaxLengthTabOrderText  /  /    TBitBtnbbtncalculaLeftHTopEWidthKHeight(CaptionCalculaFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrderOnClickbbtncalculaClick
Glyph.Data
z  v  BMv      v   (                                    ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333333???33337 333??7ww??? 	??  wss7?sww30????333737?7?33	????33s37?3s?7??????37?37?37?0??????37?37????0???   37?37www?0??
??37?3ss?7?7??????37?737?733	
??33ss33ss330????33???3373? 3
??0 w3s??s7w337 333337ww33333333333333333333333333333333333	NumGlyphs  TBitBtnbbtnimprimeLeft?TopEWidthKHeight(CaptionImprimeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrderOnClickbbtnimprimeClick
Glyph.Data
z  v  BMv      v   (                                    ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 0      ???????????????wwwwwww???????wwwwwww        ???????????????wwwwwww???????wwwwwww???????wwwwww        wwwwwww30????337????330? 337?wss330????337????330?  337?swws330???3337??73330??3337?ss3330?? 33337??w33330  33337wws333	NumGlyphs  	TMaskEdit
meddataateLeft? TopGWidth9HeightEditMask99/99/99;1;_	MaxLengthTabOrderText  /  /  OnExitmeddataateExit   ?TPanelPanel2ToprWidth3 ?TBitBtnbtnfechaLeft? DefaultKindbkCustom   TQuery	qryvendasDatabaseName
BancoDadosSessionName
Session1_3SQL.Strings*SELECT V.VENDEDOR,SUM(V.VALOR) AS TOTVENDAFROM VENDAS V2INNER JOIN VENDEDORES VD ON V.VENDEDOR = VD.CODIGO$WHERE V.DATA BETWEEN :DAT1 AND :DAT2 GROUP BY V.VENDEDOR, VD.NOME     LeftTop	ParamDataDataTypeftDateNameDAT1	ParamType	ptUnknown DataTypeftDateNameDAT2	ParamType	ptUnknown   TIntegerFieldqryvendasVENDEDOR	FieldNameVENDEDOROriginBANCODADOS.VENDAS.VENDEDOR  TFloatFieldqryvendasTOTVENDA	FieldNameTOTVENDAOriginBANCODADOS.VENDAS.VALOR    