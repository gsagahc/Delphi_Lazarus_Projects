�
 TFRMCONSCLI 0�  TPF0�Tfrmconscli
frmconscliLeft�Top� CaptionConsulta de ClientesClientHeight}ClientWidth2PixelsPerInch`
TextHeight �TPanelPanel1TopPWidth2Height �TDBGridDBGrid1Width.Height 
DataSourceDsQworkColumnsExpanded	FieldNameCodigoTitle.AlignmenttaCenterTitle.Caption   CódigoVisible	 Expanded	FieldNameNomeTitle.AlignmenttaCenterTitle.CaptionNome do ClienteVisible	 Expanded	FieldNameNomeFantasiaTitle.CaptionNome FantasiaVisible	 Expanded	FieldNameCgcTitle.AlignmenttaCenterTitle.CaptionCNPJ/CPFVisible	     �TPanelPanel2TopTWidth2ColorclInfoBk �TBitBtnbtnfechaLeft�    �TPanelPanel3Width2HeightPColorclInfoBk �TDBNavigatorDBNavigator1LeftTop
DataSourceDsQwork  �	TComboBoxcbxOrdemLeft� TopAutoCompleteStyle
csDropDownCharCaseecUpperCaseTextCODIGOVisibleItems.StringsCODIGONOMETESTE   �TEditedtConsultaLeft� Top4Width1
OnKeyPressedtConsultaKeyPress  	TCheckBoxChkBoxInativoLeft� TopWidth=HeightCaptionInativosTabOrder  TButtonButton1Left�Top2WidthKHeightCaption	LocalizarTabOrderOnClickButton1Click  	TComboBox	ComboBox1LeftTop4Width� HeightStylecsDropDownList
ItemHeight	ItemIndex TabOrderTextCODIGOOnChangeComboBox1ChangeItems.StringsCODIGONOME    TQueryQworkActive	DatabaseName
BancoDadosSessionName
Session1_3SQL.Strings%SELECT Codigo, Nome, Cgc,NomeFantasiaFROM  Clientes Left� Top| TIntegerFieldQworkCodigo	FieldNameCodigoOriginBANCODADOS."CLIENTES.DB".Codigo  TStringField	QworkNome	FieldNameNomeOriginBANCODADOS."CLIENTES.DB".NomeSize<  TStringFieldQworkCgc	FieldNameCgcOriginBANCODADOS."CLIENTES.DB".CgcSize  TStringFieldQworkNomeFantasia	FieldNameNomeFantasiaOrigin%BANCODADOS."CLIENTES.DB".NomeFantasiaSize<   TDataSourceDsQworkDataSetQworkLeft� Topx   