?
 TFRMRELTAB 0l  TPF0?
Tfrmreltab	frmreltabDataSetQuery1Functions.DATA00'' Page.Values       ?@      ??
@       ?@      ??
@       ?@       ?@           ReportTitle   Tabela de Preços ?TQRBandDetailBand1TopHeight!Size.Values      ??@ PUUUU??	@  	TQRDBText	QRDBText1LeftTopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values??????j?@       ?@UUUUUUU?@UUUUUU5?@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldCODIGOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText2Left? TopWidthIHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values??????j?@UUUUUU??@UUUUUUU?@????????@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataField	DESCRICAOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText3LeftjTopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values??????j?@      d?	@UUUUUUU?@UUUUUU5?@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetQuery1	DataFieldPRECOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.Style 
ParentFontTransparentWordWrap	FontSize   ?TQRBand
TitleBand1Height? Size.Values??????J?@ PUUUU??	@  ?
TQRSysData
QRSysData1LeftTop? Width? Height Size.Values XUUUUU?@????????@????????@      Ԕ@ Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.StylefsBoldfsItalic FontSize  ?
TQRSysData
QRSysData2Size.Values????????@????????	@ XUUUUU?@????????@ FontSize
  ?TQRLabel
qrlbtituloLeft??Top? Width%Height"Size.Values????????@??????Z?@      ??@      ??	@ Caption+   Sisloja - Sistema de Gestão AdministrativaFont.CharsetANSI_CHARSETFont.Height?	Font.NameCourier NewFontSize  TQRImageQRImage1LeftTopWidth? HeightyFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values???????@????????@????????@??????>?@ AutoSize	Center	Stretch	   ?TQRBandColumnHeaderBand1Top? Height0Frame.DrawTop	Frame.DrawBottom	Frame.DrawLeft	Frame.DrawRight	ColorclSilverSize.Values       ?@ PUUUU??	@  TQRLabelQRLabel1LeftTopWidthCHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values??????j?@       ?@ XUUUUU?@UUUUUUE?@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption   CódigoColorclSilverFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2Left? TopWidthdHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values??????j?@UUUUUU??@ XUUUUU?@??????J?@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption   DescriçãoColorclSilverFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel3LeftyTopWidth:HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ?????j?@     Z?	@ XUUUUU?@ XUUUUu?@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption   PreçoColorclSilverFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameCourier New
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   ?TQueryQuery1SQL.Strings8SELECT P.CODIGO,P.DESCRICAO,P.PRECO,P.FORNECEDOR,F.NOME FROM PRODUTOS P9LEFT OUTER JOIN FORNECEDORES F ON P.FORNECEDOR = F.CODIGOORDER BY P.CODIGO  TIntegerFieldQuery1CODIGO	FieldNameCODIGO  TStringFieldQuery1DESCRICAO	FieldName	DESCRICAOSize(  TCurrencyFieldQuery1PRECO	FieldNamePRECODisplayFormat,#0.00
EditFormat,#0.00  TIntegerFieldQuery1FORNECEDOR	FieldName
FORNECEDOR    