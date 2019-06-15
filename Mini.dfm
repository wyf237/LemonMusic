object Fm_MiniBox: TFm_MiniBox
  Left = 750
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 50
  ClientWidth = 300
  Color = 4799545
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  StyleElements = [seFont, seClient]
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PN_MinBox: TscGPPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 50
    Align = alClient
    TabOrder = 0
    BlurBackground = False
    BlurBackgroundAmount = 5
    CustomImageIndex = -1
    DragForm = True
    DragTopForm = True
    FillGradientAngle = 90
    FillGradientBeginAlpha = 255
    FillGradientEndAlpha = 255
    FillGradientBeginColorOffset = 25
    FillGradientEndColorOffset = 25
    FrameWidth = 1
    FillColor = 4799545
    FillColorAlpha = 0
    FillColor2 = clNone
    FrameColor = 4799545
    FrameColorAlpha = 255
    FrameRadius = 0
    ShowCaption = False
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = 4799545
    TransparentBackground = True
    StorePaintBuffer = True
    Sizeable = False
    WallpaperIndex = -1
    DesignSize = (
      300
      50)
    object BTN_Close: TscGPGlyphButton
      Left = 270
      Top = 0
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnClick = BTN_CloseClick
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CanFocused = False
      CustomDropDown = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clWhite
      Options.NormalColor = clRed
      Options.HotColor = clRed
      Options.PressedColor = clRed
      Options.FocusedColor = clRed
      Options.DisabledColor = clRed
      Options.NormalColor2 = 16417410
      Options.HotColor2 = 16417410
      Options.PressedColor2 = 16417410
      Options.FocusedColor2 = 16417410
      Options.DisabledColor2 = 16417410
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 0
      Options.PressedColorAlpha = 0
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 0
      Options.NormalColor2Alpha = 0
      Options.HotColor2Alpha = 0
      Options.PressedColor2Alpha = 0
      Options.FocusedColor2Alpha = 150
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clBtnText
      Options.FrameHotColor = clBtnText
      Options.FramePressedColor = clBtnText
      Options.FrameFocusedColor = clHighlight
      Options.FrameDisabledColor = clBtnText
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpEllipse
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clRed
      GlyphOptions.PressedColor = clRed
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 150
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 0
      GlyphOptions.DisabledColorAlpha = 0
      GlyphOptions.Kind = scgpbgkClose
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 0
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
    end
    object BTN_Small: TscGPGlyphButton
      Left = 270
      Top = 25
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = BTN_SmallClick
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CanFocused = False
      CustomDropDown = False
      Layout = blGlyphLeft
      TransparentBackground = True
      ColorValue = clWhite
      Options.NormalColor = 3328050
      Options.HotColor = 3328050
      Options.PressedColor = 3328050
      Options.FocusedColor = 3328050
      Options.DisabledColor = 3328050
      Options.NormalColor2 = 16417410
      Options.HotColor2 = 16417410
      Options.PressedColor2 = 16417410
      Options.FocusedColor2 = 16417410
      Options.DisabledColor2 = 16417410
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 0
      Options.PressedColorAlpha = 0
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 0
      Options.NormalColor2Alpha = 0
      Options.HotColor2Alpha = 0
      Options.PressedColor2Alpha = 0
      Options.FocusedColor2Alpha = 150
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clBtnText
      Options.FrameHotColor = clBtnText
      Options.FramePressedColor = clBtnText
      Options.FrameFocusedColor = clHighlight
      Options.FrameDisabledColor = clBtnText
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpEllipse
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWhite
      GlyphOptions.NormalColorAlpha = 150
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 0
      GlyphOptions.DisabledColorAlpha = 0
      GlyphOptions.Kind = scgpbgkDownArrow
      GlyphOptions.Thickness = 1
      GlyphOptions.ThicknessScaled = False
      GlyphOptions.Size = 0
      GlyphOptions.StyleColors = True
      TextMargin = -1
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
    end
    object BTN_Voice: TscGPButton
      Left = 210
      Top = 15
      Width = 20
      Height = 20
      Cursor = crHandPoint
      TabOrder = 1
      TabStop = True
      OnClick = BTN_VoiceClick
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CanFocused = True
      CustomDropDown = False
      Margin = -1
      Spacing = 1
      Layout = blGlyphLeft
      Images = Fm_Main.IL_Btn_Ico
      ImageIndex = 4
      ImageMargin = 0
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clWhite
      Options.PressedColor = clWhite
      Options.FocusedColor = clWhite
      Options.DisabledColor = clWhite
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 50
      Options.PressedColorAlpha = 100
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 0
      Options.NormalColor2Alpha = 0
      Options.HotColor2Alpha = 0
      Options.PressedColor2Alpha = 0
      Options.FocusedColor2Alpha = 0
      Options.DisabledColor2Alpha = 0
      Options.FrameNormalColor = clBtnShadow
      Options.FrameHotColor = clHighlight
      Options.FramePressedColor = clHighlight
      Options.FrameFocusedColor = clHighlight
      Options.FrameDisabledColor = clBtnShadow
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpEllipse
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      HotImageIndex = -1
      FocusedImageIndex = -1
      PressedImageIndex = -1
      UseGalleryMenuImage = False
      UseGalleryMenuCaption = False
      ScaleMarginAndSpacing = False
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      GlowEffect.Enabled = False
      GlowEffect.Color = clHighlight
      GlowEffect.AlphaValue = 255
      GlowEffect.GlowSize = 7
      GlowEffect.Offset = 0
      GlowEffect.Intensive = True
      GlowEffect.StyleColors = True
      GlowEffect.HotColor = clNone
      GlowEffect.PressedColor = clNone
      GlowEffect.FocusedColor = clNone
      GlowEffect.PressedGlowSize = 7
      GlowEffect.PressedAlphaValue = 255
      GlowEffect.States = [scsHot, scsPressed, scsFocused]
      ImageGlow = True
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
    end
    object BTN_PlayList: TscGPButton
      Left = 240
      Top = 15
      Width = 20
      Height = 20
      Cursor = crHandPoint
      Hint = #21015#34920#24490#29615
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = True
      OnClick = BTN_PlayListClick
      Animation = True
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CanFocused = True
      CustomDropDown = False
      Margin = -1
      Spacing = 1
      Layout = blGlyphLeft
      Images = Fm_Main.IL_Btn_Ico
      ImageIndex = 14
      ImageMargin = 0
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clWhite
      Options.PressedColor = clWhite
      Options.FocusedColor = clWhite
      Options.DisabledColor = clWhite
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 50
      Options.PressedColorAlpha = 100
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 0
      Options.NormalColor2Alpha = 0
      Options.HotColor2Alpha = 0
      Options.PressedColor2Alpha = 0
      Options.FocusedColor2Alpha = 0
      Options.DisabledColor2Alpha = 0
      Options.FrameNormalColor = clBtnShadow
      Options.FrameHotColor = clHighlight
      Options.FramePressedColor = clHighlight
      Options.FrameFocusedColor = clHighlight
      Options.FrameDisabledColor = clBtnShadow
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpEllipse
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      HotImageIndex = -1
      FocusedImageIndex = -1
      PressedImageIndex = -1
      UseGalleryMenuImage = False
      UseGalleryMenuCaption = False
      ScaleMarginAndSpacing = False
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      GlowEffect.Enabled = False
      GlowEffect.Color = clHighlight
      GlowEffect.AlphaValue = 255
      GlowEffect.GlowSize = 7
      GlowEffect.Offset = 0
      GlowEffect.Intensive = True
      GlowEffect.StyleColors = True
      GlowEffect.HotColor = clNone
      GlowEffect.PressedColor = clNone
      GlowEffect.FocusedColor = clNone
      GlowEffect.PressedGlowSize = 7
      GlowEffect.PressedAlphaValue = 255
      GlowEffect.States = [scsHot, scsPressed, scsFocused]
      ImageGlow = True
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
    end
    object Music_Logo_Img: TscGPImage
      Left = 1
      Top = 1
      Width = 48
      Height = 48
      TabOrder = 4
      CustomImageIndex = -1
      DragForm = True
      DragTopForm = True
      StyleKind = scpsTransparent
      ShowCaption = False
      BorderStyle = scpbsNone
      WallpaperIndex = -1
      LightBorderColor = clBtnHighlight
      ShadowBorderColor = clBtnShadow
      CaptionGlowEffect.Enabled = False
      CaptionGlowEffect.Color = clBtnShadow
      CaptionGlowEffect.AlphaValue = 255
      CaptionGlowEffect.GlowSize = 7
      CaptionGlowEffect.Offset = 0
      CaptionGlowEffect.Intensive = True
      CaptionGlowEffect.StyleColors = True
      Color = 2302755
      StorePaintBuffer = False
      ImageIndex = -1
      InterpolationMode = scgppimDefault
      ClipFrame = scgpcfNone
      ClipFrameRadius = 10
      ClipFrameFillColor = 2302755
      ClipFrameFillColorAlpha = 255
      ClipFrameColor = 2302755
      ClipFrameWidth = 0
      Position = scgpipCenter
      RotationAngle = 0
      AnimationAcceleration = False
      RotateAnimation = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000030
        0000003008060000005702F987000000097048597300000B1300000B1301009A
        9C1800000CE469545874584D4C3A636F6D2E61646F62652E786D700000000000
        3C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D70
        43656869487A7265537A4E54637A6B633964223F3E203C783A786D706D657461
        20786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D7074
        6B3D2241646F626520584D5020436F726520352E362D633134352037392E3136
        333439392C20323031382F30382F31332D31363A34303A323220202020202020
        20223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F77
        77772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D
        6E7323223E203C7264663A4465736372697074696F6E207264663A61626F7574
        3D222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F6265
        2E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F7354797065
        2F5265736F757263654576656E74232220786D6C6E733A73745265663D226874
        74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
        5265736F75726365526566232220786D6C6E733A64633D22687474703A2F2F70
        75726C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A
        70686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70
        686F746F73686F702F312E302F2220786D6C6E733A786D703D22687474703A2F
        2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A7469
        66663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E30
        2F2220786D6C6E733A657869663D22687474703A2F2F6E732E61646F62652E63
        6F6D2F657869662F312E302F2220786D704D4D3A446F63756D656E7449443D22
        61646F62653A646F6369643A70686F746F73686F703A65363562353565662D65
        6538312D353634382D383734662D6366633534383133353264352220786D704D
        4D3A496E7374616E636549443D22786D702E6969643A66633734633133372D33
        3238642D313934632D626238342D3165343338376664366338652220786D704D
        4D3A4F726967696E616C446F63756D656E7449443D2235323841383437334444
        31304434463933373543443736424442423235463942222064633A666F726D61
        743D22696D6167652F706E67222070686F746F73686F703A436F6C6F724D6F64
        653D2233222070686F746F73686F703A49434350726F66696C653D222220786D
        703A437265617465446174653D22323031392D30322D32355431393A33303A35
        382B30383A30302220786D703A4D6F64696679446174653D22323031392D3033
        2D32335432303A30303A35322B30383A30302220786D703A4D65746164617461
        446174653D22323031392D30332D32335432303A30303A35322B30383A303022
        20786D703A43726561746F72546F6F6C3D2241646F62652050686F746F73686F
        702043432032303139202857696E646F7773292220746966663A496D61676557
        696474683D223530302220746966663A496D6167654C656E6774683D22373234
        2220746966663A50686F746F6D6574726963496E746572707265746174696F6E
        3D22322220746966663A4F7269656E746174696F6E3D22312220746966663A53
        616D706C6573506572506978656C3D22332220746966663A585265736F6C7574
        696F6E3D223732303030302F31303030302220746966663A595265736F6C7574
        696F6E3D223732303030302F31303030302220746966663A5265736F6C757469
        6F6E556E69743D22322220657869663A4578696656657273696F6E3D22303232
        312220657869663A436F6C6F7253706163653D2236353533352220657869663A
        506978656C5844696D656E73696F6E3D223334312220657869663A506978656C
        5944696D656E73696F6E3D22333431223E203C786D704D4D3A486973746F7279
        3E203C7264663A5365713E203C7264663A6C692073744576743A616374696F6E
        3D227361766564222073744576743A696E7374616E636549443D22786D702E69
        69643A61393733343037632D666562622D653734382D613566662D6337353239
        35613134343165222073744576743A7768656E3D22323031392D30322D323554
        32303A30393A33362B30383A3030222073744576743A736F6674776172654167
        656E743D2241646F62652050686F746F73686F70204343203230313920285769
        6E646F777329222073744576743A6368616E6765643D222F222F3E203C726466
        3A6C692073744576743A616374696F6E3D22636F6E7665727465642220737445
        76743A706172616D65746572733D2266726F6D20696D6167652F6A7065672074
        6F206170706C69636174696F6E2F766E642E61646F62652E70686F746F73686F
        70222F3E203C7264663A6C692073744576743A616374696F6E3D226465726976
        6564222073744576743A706172616D65746572733D22636F6E76657274656420
        66726F6D20696D6167652F6A70656720746F206170706C69636174696F6E2F76
        6E642E61646F62652E70686F746F73686F70222F3E203C7264663A6C69207374
        4576743A616374696F6E3D227361766564222073744576743A696E7374616E63
        6549443D22786D702E6969643A32653364343263372D396231302D653234302D
        616235612D656265656535343338613333222073744576743A7768656E3D2232
        3031392D30322D32355432303A30393A33362B30383A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303139202857696E646F777329222073744576743A6368616E6765643D
        222F222F3E203C7264663A6C692073744576743A616374696F6E3D2273617665
        64222073744576743A696E7374616E636549443D22786D702E6969643A313635
        30396139662D356337332D633534312D383739642D6437646431323965653639
        61222073744576743A7768656E3D22323031392D30332D32335432303A30303A
        35322B30383A3030222073744576743A736F6674776172654167656E743D2241
        646F62652050686F746F73686F702043432032303139202857696E646F777329
        222073744576743A6368616E6765643D222F222F3E203C7264663A6C69207374
        4576743A616374696F6E3D22636F6E766572746564222073744576743A706172
        616D65746572733D2266726F6D206170706C69636174696F6E2F766E642E6164
        6F62652E70686F746F73686F7020746F20696D6167652F706E67222F3E203C72
        64663A6C692073744576743A616374696F6E3D22646572697665642220737445
        76743A706172616D65746572733D22636F6E7665727465642066726F6D206170
        706C69636174696F6E2F766E642E61646F62652E70686F746F73686F7020746F
        20696D6167652F706E67222F3E203C7264663A6C692073744576743A61637469
        6F6E3D227361766564222073744576743A696E7374616E636549443D22786D70
        2E6969643A66633734633133372D333238642D313934632D626238342D316534
        333837666436633865222073744576743A7768656E3D22323031392D30332D32
        335432303A30303A35322B30383A3030222073744576743A736F667477617265
        4167656E743D2241646F62652050686F746F73686F7020434320323031392028
        57696E646F777329222073744576743A6368616E6765643D222F222F3E203C2F
        7264663A5365713E203C2F786D704D4D3A486973746F72793E203C786D704D4D
        3A4465726976656446726F6D2073745265663A696E7374616E636549443D2278
        6D702E6969643A31363530396139662D356337332D633534312D383739642D64
        3764643132396565363961222073745265663A646F63756D656E7449443D2261
        646F62653A646F6369643A70686F746F73686F703A30613237616334642D3934
        39612D653734662D383061612D35376134643366633565336422207374526566
        3A6F726967696E616C446F63756D656E7449443D223532384138343733444431
        304434463933373543443736424442423235463942222F3E203C70686F746F73
        686F703A546578744C61796572733E203C7264663A4261673E203C7264663A6C
        692070686F746F73686F703A4C617965724E616D653D224D222070686F746F73
        686F703A4C61796572546578743D224D222F3E203C2F7264663A4261673E203C
        2F70686F746F73686F703A546578744C61796572733E203C746966663A426974
        7350657253616D706C653E203C7264663A5365713E203C7264663A6C693E383C
        2F7264663A6C693E203C7264663A6C693E383C2F7264663A6C693E203C726466
        3A6C693E383C2F7264663A6C693E203C2F7264663A5365713E203C2F74696666
        3A4269747350657253616D706C653E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F787061
        636B657420656E643D2272223F3E967CD49D0000092F494441546881D59A6B8C
        55D515C77F7BEF731F33C365EE38581149915279294491368E0A2218D2929A14
        A3559BA66D4CDB0F7EECC32FADA969D2877E69D2A489B669BF69D3581BB52ABE
        78082A056AE5A5623532C8800C3ACF3BCCF39CBDFAE13CF73D776618D0185672
        72CFB967DF7DFEFFB5FF6BEDB5F7B9AA63EDC61340850BD36A1E30EFF346711E
        56D140EDF346711E56D39F3782F335EFB3EA78F1A221AE5C3AC4BCB9E3CCAE58
        9482D1718F9E5E8F0F8E3571F0700B0383E7FFF84F95C04DD77FC29DB776B3E4
        8B1378A680520641010630580940819521AC9CA1362A1C7CCFE3C9E72AECDFDF
        7C4ECF541D6B370E729E59E89EBB3BB96B530F4DC508B4684414160D68243AC0
        206292EF94F2103104C0D078C0B63D86C79F68E174F759FBB5765E046E59DBCD
        7D3FFC90A65231046589806600C704C464EE452431493BF0B0687C8191C0323C
        0E9E31140A454419AC781C3F3DC683BF16FA7A3E05027F7AF000CB170680C15A
        95804BC1A79E170C487A9E052F186C746D31200651A1E4020C8128243A471518
        B513FCF4C703F47C1C12987116BAE6AA3EB63DB697E55FB258D158990A7C2499
        047016BC89C01BE75E80C617C54474F8682624FC6ECC0A8A66BE7F6F29C133A3
        20BEE7EE4EEED9FC0950C05A95789519C94667C06B6CD4CE667E6749AF83E89E
        4DCE61CEC54DC0D8CC083CF0937758B54478F2850508802804C5B52B6A5C76E9
        68029C06E01369C400C5D0DB6F786D5F015058D18062C50AC52573BD08B0CA80
        3704846451454E9CEA9FD9083C74FF5BDCB07294871E5ECC535BEBC3A59D3FFF
        F624572C1C49BD2FE96884E04CE4D990D8F0A8C72F7E57A4F3B8CAF423545B85
        47FEA8236FEB087428338B26204CCBAF6D1B4B7E356D0CFCEA676F73C3CA31AC
        D50DC087F6E893ED21B80C7869083EF4EED65D5E1DF8D0FA0708BD9D78DE4BBC
        1F067191A18961DE7CDD9E1D81EFDE7E8C0D5F1D0DB38C4CDE74C79E12BD7DA5
        48366EB0267A162F2269D8F2B299B4AF4052C0560C81A4311188E1E0FE21A7FD
        A4A8AEB8BCC68FBEF54992E2A61BACE777B43A019A1E719086F70EBEEDD1D935
        793F41066C4C2488884C00EF1E9E383B02BF7FE008E802E2649BC9ED9FCF37A7
        9E774622CE28A1479F7D312F9DAC6525143812F20844D37BDA3AED1BA2BAF77B
        1F506D296103C866977ABBA835EDAC7740B1FB8DE6DC04652352560C3DFD9AD7
        F7A5BF6F6DCD930983D744124A833988D2E8C59716A62770FBD7FB224F6627A6
        BC6E6FFBDA8873FDF2CE726E82B29963EB4E17F0E66F16F30432693391101EBE
        68ACF258B0B43C35811F7CBB93A2292136BEAD271D818DEB869DEB9D7B3D7AFB
        BC24ED5947429A675F10A7FDB5AB4BD49B8DA41288C64FCA091DD5499A4ADB34
        0436DDDC97F37C7CD45B5B55B87A79E07CF7E22BC52460B344F6FC57D13F90B6
        5BB7AE40A55AA0DE52097949160A30F8187C092BD84909CCBF7484F64A01B1F5
        9E6F1CC42286DB368D39DFEDD81DA5CC3A093DB3C50DBEEBAE2F1348DE29490A
        7524148E88551E6786A7C8426B3A7AC21A1D956A39A963F293B6C5B062B9A5AD
        359546E771C5A177E2DC1D7E9E3C056FBD9312983FDF70C5B2A6B0C4C81188BC
        2E26033E3DEFEF7147DC21B064D108A83860E3DC9FAD6B5C130CA59262C31AD7
        BBAFBC1E8E58ECC997B7BBF76F5ADF9448234740B2415C3F1F283E3AEA8EB883
        EA92394102369EFA45BC4983380ED01BAF7383F3C5ED424F7FE8FDE151CDCE5D
        BE73FFEAD5CD49B0E60810066FACF924A5E261B1FC6FBF9B389C1E5A9A21F67C
        4CC4AD6B5C8BE5B5F072CD82F9EEBD7FEF132C86BDFFB10C0CA604D7AC2B33AB
        5A4AD2659E4054798AAE3B2F30365263A86F0A09958A022ACE38F91554BD6533
        CDE65B5D822F6D0D08C4F0AF67DC215FDD312B99A0FC06A31A4F607E663EF0A3
        51397AA82FD7DE894CA523CF8B64EA98B4A2AC379B14689AABAED440AAF5E35D
        96A79E1EA5AB2BFD6EDE7C8F2F2F6D71B24B8E80A4D9C78A8ACE0B8858F66EE9
        C9B5777A1819F33205592C232FA9E37304A258B1182A558F0D37BB6DFEF1F8A8
        737DE3FA4A3A3945A3972310A5CF107C14C0AAC8E8E0294E758E4F4D606C3CB3
        ECAB5B4135D26B1C0371B6E9E8C8CFAC595B796D25E3DD2924442685E26151BC
        FAC489867D3A3D0C9CD1809701EFD63479025E02DE8A61F1B212B36737AE363B
        6E6AA1B95A8AAACD54E33902A232AB314D40193B7C8AC3BB1A6FE13A04FA068A
        D12E435A0AC7E0279750B4F088DADDB2B1A9E183AEB9BE350ADE54428DD3A897
        78DFA74080E5B987DF6FD8678E40F7C79E534DC65E8817243902625C40183AD6
        CECAB59B3BBFC0C225B333B24847214F4013108D822AD3F7FE7B741E1ACEB56B
        48E0C44785700556B708B1930D7752B398A482AC548B5CFD15B762BC6E7DD52D
        8F250DFE9C53A2BAC757CD18FB317FFFCDD149C1435D1AED3C5626103FC942D9
        1D338BE6819F7B7CD825088AB68BBC34E0442744AC68EEF8CEC52C5A76064153
        2C7B2C5B554DC98A76CEEFBC6F39A74F0E2368DAE6CD221085AF9A30DAE7F15F
        BE3925F81C81B6B60051513D2FD94DA6F073E932CDE265F50B6D9DD9B7093F5B
        AA9A8E0D4DC98A2C4D8DD9F3F0F3B2A5EDCC5D3A274A049A09C24CF6CA5F7673
        FA583E6D4E49E0AE3B8651B46345924548BA1F6392E93D26E480CF804B761492
        DFBB4B439B1D3174B489A5F0551950ECFBDBABBCB56B705AF00E8155AB465834
        B70DDF2A2CCAF1BE643C9C02D68984923848B252066C9D6C9C1A2702EF8BC157
        65B49C61C7236FF0EEDEB37FEB951058BF7E14A52AF8490C840F49262A49359E
        9D6824032870C0BBB191954D96984F914069F448378FDDBF9F5AAF3F15DEC909
        BCF1668935D7085A95124F42BCA3409D4C4CC6D32AD57F5D8066E3222513AD6F
        29E0AB025A8DD1B9EB6D5EFAEBA91901CF11D8BEB5996A75883537161919B38C
        8D2B4ACD9A2FCC69A2E8CD46281088349049BA739C7A361B0FA9E67DBC64A282
        09068F76F2F41F8E7266209802E2D476562F386EB859F8C66DCDB457E7802A33
        61053F22532F9BF8DCCF125525AC2A606D80488DAEC3DD6C7BF424FDA727A67A
        ECD9D8CCDED0AC58AD58B7A9CC828555B4AE108887280F5F543A7B62B0AA4020
        615D63514C8C0FD2DDD9CB913D031CD8FEA9BE963EB7574C4AC192951E8B9697
        699F5BA0A55A0EB72155B896A80D8C32D06BE9EE1AE7E8A1617A3E9A3E9F9FA3
        D5CEE935AB081C39E073E4C0D0F48D3F63BBE0DFD46B2EDC7FAA00543CE02417
        2E89DAFF014AA2B38403A6CBF10000000049454E44AE426082}
      Stretch = True
      Transparent = True
    end
    object PV_Main: TscGPPageViewer
      Left = 50
      Top = 1
      Width = 150
      Height = 48
      TabOrder = 5
      PageIndex = 1
      Pages = <
        item
          Page = PVP_Control
        end
        item
          Page = PVP_Info
        end>
      ActivePage = PVP_Info
      object PVP_Control: TscGPPageViewerPage
        Left = 0
        Top = 0
        Width = 150
        Height = 48
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        BlurBackground = False
        BlurBackgroundAmount = 5
        CustomImageIndex = -1
        DragForm = True
        DragTopForm = True
        FillGradientAngle = 90
        FillGradientBeginAlpha = 255
        FillGradientEndAlpha = 255
        FillGradientBeginColorOffset = 25
        FillGradientEndColorOffset = 25
        FrameWidth = 0
        FillColor = 4799545
        FillColorAlpha = 255
        FillColor2 = clNone
        FrameColor = clBtnShadow
        FrameColorAlpha = 255
        FrameRadius = 0
        ShowCaption = False
        CaptionGlowEffect.Enabled = False
        CaptionGlowEffect.Color = clBtnShadow
        CaptionGlowEffect.AlphaValue = 255
        CaptionGlowEffect.GlowSize = 7
        CaptionGlowEffect.Offset = 0
        CaptionGlowEffect.Intensive = True
        CaptionGlowEffect.StyleColors = True
        Color = clBtnFace
        Caption = 'PVP_Control'
        TransparentBackground = True
        StorePaintBuffer = True
        Sizeable = False
        WallpaperIndex = -1
        object BTN_Last: TscGPButton
          Left = 20
          Top = 12
          Width = 24
          Height = 24
          Cursor = crHandPoint
          TabOrder = 0
          TabStop = True
          OnClick = BTN_LastClick
          Animation = False
          Badge.Color = clRed
          Badge.ColorAlpha = 255
          Badge.Font.Charset = DEFAULT_CHARSET
          Badge.Font.Color = clWhite
          Badge.Font.Height = -11
          Badge.Font.Name = 'Tahoma'
          Badge.Font.Style = [fsBold]
          Badge.Visible = False
          CanFocused = True
          CustomDropDown = False
          Margin = -1
          Spacing = 1
          Layout = blGlyphLeft
          Images = Fm_Main.IL_Btn_Ico
          ImageIndex = 2
          ImageMargin = 0
          TransparentBackground = True
          Options.NormalColor = clWhite
          Options.HotColor = clBtnFace
          Options.PressedColor = clWhite
          Options.FocusedColor = clWhite
          Options.DisabledColor = clWhite
          Options.NormalColor2 = clNone
          Options.HotColor2 = clNone
          Options.PressedColor2 = clNone
          Options.FocusedColor2 = clNone
          Options.DisabledColor2 = clNone
          Options.NormalColorAlpha = 0
          Options.HotColorAlpha = 50
          Options.PressedColorAlpha = 100
          Options.FocusedColorAlpha = 0
          Options.DisabledColorAlpha = 0
          Options.NormalColor2Alpha = 0
          Options.HotColor2Alpha = 50
          Options.PressedColor2Alpha = 100
          Options.FocusedColor2Alpha = 0
          Options.DisabledColor2Alpha = 0
          Options.FrameNormalColor = clBtnShadow
          Options.FrameHotColor = clHighlight
          Options.FramePressedColor = clHighlight
          Options.FrameFocusedColor = clHighlight
          Options.FrameDisabledColor = clBtnShadow
          Options.FrameWidth = 1
          Options.FrameNormalColorAlpha = 0
          Options.FrameHotColorAlpha = 0
          Options.FramePressedColorAlpha = 0
          Options.FrameFocusedColorAlpha = 0
          Options.FrameDisabledColorAlpha = 0
          Options.FontNormalColor = clBtnText
          Options.FontHotColor = clBtnText
          Options.FontPressedColor = clBtnText
          Options.FontFocusedColor = clBtnText
          Options.FontDisabledColor = clBtnShadow
          Options.ShapeFillGradientAngle = 90
          Options.ShapeFillGradientPressedAngle = -90
          Options.ShapeFillGradientColorOffset = 25
          Options.ShapeCornerRadius = 10
          Options.ShapeStyle = scgpEllipse
          Options.ArrowSize = 9
          Options.ArrowAreaSize = 0
          Options.ArrowType = scgpatDefault
          Options.ArrowThickness = 2
          Options.ArrowThicknessScaled = False
          Options.ArrowNormalColor = clBtnText
          Options.ArrowHotColor = clBtnText
          Options.ArrowPressedColor = clBtnText
          Options.ArrowFocusedColor = clBtnText
          Options.ArrowDisabledColor = clBtnText
          Options.ArrowNormalColorAlpha = 200
          Options.ArrowHotColorAlpha = 255
          Options.ArrowPressedColorAlpha = 255
          Options.ArrowFocusedColorAlpha = 200
          Options.ArrowDisabledColorAlpha = 125
          Options.StyleColors = True
          HotImageIndex = -1
          FocusedImageIndex = -1
          PressedImageIndex = -1
          UseGalleryMenuImage = False
          UseGalleryMenuCaption = False
          ScaleMarginAndSpacing = False
          WidthWithCaption = 0
          WidthWithoutCaption = 0
          SplitButton = False
          RepeatClick = False
          RepeatClickInterval = 100
          GlowEffect.Enabled = False
          GlowEffect.Color = clHighlight
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          GlowEffect.HotColor = clNone
          GlowEffect.PressedColor = clNone
          GlowEffect.FocusedColor = clNone
          GlowEffect.PressedGlowSize = 7
          GlowEffect.PressedAlphaValue = 255
          GlowEffect.States = [scsHot, scsPressed, scsFocused]
          ImageGlow = True
          ShowGalleryMenuFromTop = False
          ShowGalleryMenuFromRight = False
          ShowMenuArrow = True
          ShowFocusRect = True
          Down = False
          GroupIndex = 0
          AllowAllUp = False
        end
        object BTN_Next: TscGPButton
          Left = 104
          Top = 12
          Width = 24
          Height = 24
          Cursor = crHandPoint
          TabOrder = 1
          TabStop = True
          OnClick = BTN_NextClick
          Animation = False
          Badge.Color = clRed
          Badge.ColorAlpha = 255
          Badge.Font.Charset = DEFAULT_CHARSET
          Badge.Font.Color = clWhite
          Badge.Font.Height = -11
          Badge.Font.Name = 'Tahoma'
          Badge.Font.Style = [fsBold]
          Badge.Visible = False
          CanFocused = True
          CustomDropDown = False
          Margin = -1
          Spacing = 1
          Layout = blGlyphLeft
          Images = Fm_Main.IL_Btn_Ico
          ImageIndex = 3
          ImageMargin = 0
          TransparentBackground = True
          Options.NormalColor = clWhite
          Options.HotColor = clBtnFace
          Options.PressedColor = clWhite
          Options.FocusedColor = clWhite
          Options.DisabledColor = clWhite
          Options.NormalColor2 = clNone
          Options.HotColor2 = clNone
          Options.PressedColor2 = clNone
          Options.FocusedColor2 = clNone
          Options.DisabledColor2 = clNone
          Options.NormalColorAlpha = 0
          Options.HotColorAlpha = 50
          Options.PressedColorAlpha = 100
          Options.FocusedColorAlpha = 0
          Options.DisabledColorAlpha = 0
          Options.NormalColor2Alpha = 0
          Options.HotColor2Alpha = 50
          Options.PressedColor2Alpha = 100
          Options.FocusedColor2Alpha = 0
          Options.DisabledColor2Alpha = 0
          Options.FrameNormalColor = clBtnShadow
          Options.FrameHotColor = clHighlight
          Options.FramePressedColor = clHighlight
          Options.FrameFocusedColor = clHighlight
          Options.FrameDisabledColor = clBtnShadow
          Options.FrameWidth = 1
          Options.FrameNormalColorAlpha = 0
          Options.FrameHotColorAlpha = 0
          Options.FramePressedColorAlpha = 0
          Options.FrameFocusedColorAlpha = 0
          Options.FrameDisabledColorAlpha = 0
          Options.FontNormalColor = clBtnText
          Options.FontHotColor = clBtnText
          Options.FontPressedColor = clBtnText
          Options.FontFocusedColor = clBtnText
          Options.FontDisabledColor = clBtnShadow
          Options.ShapeFillGradientAngle = 90
          Options.ShapeFillGradientPressedAngle = -90
          Options.ShapeFillGradientColorOffset = 25
          Options.ShapeCornerRadius = 10
          Options.ShapeStyle = scgpEllipse
          Options.ArrowSize = 9
          Options.ArrowAreaSize = 0
          Options.ArrowType = scgpatDefault
          Options.ArrowThickness = 2
          Options.ArrowThicknessScaled = False
          Options.ArrowNormalColor = clBtnText
          Options.ArrowHotColor = clBtnText
          Options.ArrowPressedColor = clBtnText
          Options.ArrowFocusedColor = clBtnText
          Options.ArrowDisabledColor = clBtnText
          Options.ArrowNormalColorAlpha = 200
          Options.ArrowHotColorAlpha = 255
          Options.ArrowPressedColorAlpha = 255
          Options.ArrowFocusedColorAlpha = 200
          Options.ArrowDisabledColorAlpha = 125
          Options.StyleColors = True
          HotImageIndex = -1
          FocusedImageIndex = -1
          PressedImageIndex = -1
          UseGalleryMenuImage = False
          UseGalleryMenuCaption = False
          ScaleMarginAndSpacing = False
          WidthWithCaption = 0
          WidthWithoutCaption = 0
          SplitButton = False
          RepeatClick = False
          RepeatClickInterval = 100
          GlowEffect.Enabled = False
          GlowEffect.Color = clHighlight
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          GlowEffect.HotColor = clNone
          GlowEffect.PressedColor = clNone
          GlowEffect.FocusedColor = clNone
          GlowEffect.PressedGlowSize = 7
          GlowEffect.PressedAlphaValue = 255
          GlowEffect.States = [scsHot, scsPressed, scsFocused]
          ImageGlow = True
          ShowGalleryMenuFromTop = False
          ShowGalleryMenuFromRight = False
          ShowMenuArrow = True
          ShowFocusRect = True
          Down = False
          GroupIndex = 0
          AllowAllUp = False
        end
        object BTN_Play_Pause: TscGPButton
          Left = 59
          Top = 8
          Width = 32
          Height = 32
          Cursor = crHandPoint
          TabOrder = 2
          TabStop = True
          OnClick = BTN_Play_PauseClick
          Animation = False
          Badge.Color = clRed
          Badge.ColorAlpha = 255
          Badge.Font.Charset = DEFAULT_CHARSET
          Badge.Font.Color = clWhite
          Badge.Font.Height = -11
          Badge.Font.Name = 'Tahoma'
          Badge.Font.Style = [fsBold]
          Badge.Visible = False
          CanFocused = True
          CustomDropDown = False
          Margin = -1
          Spacing = 1
          Layout = blGlyphLeft
          Images = Fm_Main.IL_Btn_Ico
          ImageIndex = 0
          ImageMargin = 0
          TransparentBackground = True
          Options.NormalColor = clWhite
          Options.HotColor = clBtnFace
          Options.PressedColor = clWhite
          Options.FocusedColor = clWhite
          Options.DisabledColor = clWhite
          Options.NormalColor2 = clNone
          Options.HotColor2 = clNone
          Options.PressedColor2 = clNone
          Options.FocusedColor2 = clNone
          Options.DisabledColor2 = clNone
          Options.NormalColorAlpha = 0
          Options.HotColorAlpha = 50
          Options.PressedColorAlpha = 100
          Options.FocusedColorAlpha = 0
          Options.DisabledColorAlpha = 0
          Options.NormalColor2Alpha = 0
          Options.HotColor2Alpha = 50
          Options.PressedColor2Alpha = 100
          Options.FocusedColor2Alpha = 0
          Options.DisabledColor2Alpha = 0
          Options.FrameNormalColor = clBtnShadow
          Options.FrameHotColor = clHighlight
          Options.FramePressedColor = clHighlight
          Options.FrameFocusedColor = clHighlight
          Options.FrameDisabledColor = clBtnShadow
          Options.FrameWidth = 1
          Options.FrameNormalColorAlpha = 0
          Options.FrameHotColorAlpha = 0
          Options.FramePressedColorAlpha = 0
          Options.FrameFocusedColorAlpha = 0
          Options.FrameDisabledColorAlpha = 0
          Options.FontNormalColor = clBtnText
          Options.FontHotColor = clBtnText
          Options.FontPressedColor = clBtnText
          Options.FontFocusedColor = clBtnText
          Options.FontDisabledColor = clBtnShadow
          Options.ShapeFillGradientAngle = 90
          Options.ShapeFillGradientPressedAngle = -90
          Options.ShapeFillGradientColorOffset = 25
          Options.ShapeCornerRadius = 10
          Options.ShapeStyle = scgpEllipse
          Options.ArrowSize = 9
          Options.ArrowAreaSize = 0
          Options.ArrowType = scgpatDefault
          Options.ArrowThickness = 2
          Options.ArrowThicknessScaled = False
          Options.ArrowNormalColor = clBtnText
          Options.ArrowHotColor = clBtnText
          Options.ArrowPressedColor = clBtnText
          Options.ArrowFocusedColor = clBtnText
          Options.ArrowDisabledColor = clBtnText
          Options.ArrowNormalColorAlpha = 200
          Options.ArrowHotColorAlpha = 255
          Options.ArrowPressedColorAlpha = 255
          Options.ArrowFocusedColorAlpha = 200
          Options.ArrowDisabledColorAlpha = 125
          Options.StyleColors = True
          HotImageIndex = -1
          FocusedImageIndex = -1
          PressedImageIndex = -1
          UseGalleryMenuImage = False
          UseGalleryMenuCaption = False
          ScaleMarginAndSpacing = False
          WidthWithCaption = 0
          WidthWithoutCaption = 0
          SplitButton = False
          RepeatClick = False
          RepeatClickInterval = 100
          GlowEffect.Enabled = False
          GlowEffect.Color = clHighlight
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          GlowEffect.HotColor = clNone
          GlowEffect.PressedColor = clNone
          GlowEffect.FocusedColor = clNone
          GlowEffect.PressedGlowSize = 7
          GlowEffect.PressedAlphaValue = 255
          GlowEffect.States = [scsHot, scsPressed, scsFocused]
          ImageGlow = True
          ShowGalleryMenuFromTop = False
          ShowGalleryMenuFromRight = False
          ShowMenuArrow = True
          ShowFocusRect = True
          Down = False
          GroupIndex = 0
          AllowAllUp = False
        end
      end
      object PVP_Info: TscGPPageViewerPage
        Left = 0
        Top = 0
        Width = 150
        Height = 48
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        BlurBackground = False
        BlurBackgroundAmount = 5
        CustomImageIndex = -1
        DragForm = True
        DragTopForm = True
        FillGradientAngle = 90
        FillGradientBeginAlpha = 255
        FillGradientEndAlpha = 255
        FillGradientBeginColorOffset = 25
        FillGradientEndColorOffset = 25
        FrameWidth = 0
        FillColor = 4799545
        FillColorAlpha = 255
        FillColor2 = clNone
        FrameColor = clBtnShadow
        FrameColorAlpha = 255
        FrameRadius = 0
        ShowCaption = False
        CaptionGlowEffect.Enabled = False
        CaptionGlowEffect.Color = clBtnShadow
        CaptionGlowEffect.AlphaValue = 255
        CaptionGlowEffect.GlowSize = 7
        CaptionGlowEffect.Offset = 0
        CaptionGlowEffect.Intensive = True
        CaptionGlowEffect.StyleColors = True
        Color = clBtnFace
        Caption = 'PVP_Info'
        TransparentBackground = True
        StorePaintBuffer = True
        Sizeable = False
        WallpaperIndex = -1
        object Lb_Song_Name: TscGPLabel
          Left = 0
          Top = 0
          Width = 150
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = #24494#36719#38597#40657' Light'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          DragForm = True
          DragTopForm = True
          ContentMarginLeft = 5
          ContentMarginRight = 5
          ContentMarginTop = 5
          ContentMarginBottom = 5
          DisabledFontColor = clNone
          FrameWidth = 1
          FillColor = clBtnText
          FillColorAlpha = 0
          FillColor2 = clNone
          FillColor2Alpha = 0
          FillGradientAngle = 0
          FrameColor = clBtnText
          FrameColorAlpha = 0
          FrameRadius = 5
          GlowEffect.Enabled = False
          GlowEffect.Color = clBtnShadow
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          AutoSize = False
          Layout = tlCenter
          Alignment = taCenter
          VertAlignment = scvtaCenter
          ShowEllipsis = True
          Caption = #26592#27308#38899#20048
        end
        object Lb_Song_Singer: TscGPLabel
          Left = 0
          Top = 23
          Width = 150
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -12
          Font.Name = #24494#36719#38597#40657' Light'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          DragForm = True
          DragTopForm = True
          ContentMarginLeft = 5
          ContentMarginRight = 5
          ContentMarginTop = 5
          ContentMarginBottom = 5
          DisabledFontColor = clNone
          FrameWidth = 1
          FillColor = clBtnText
          FillColorAlpha = 0
          FillColor2 = clNone
          FillColor2Alpha = 0
          FillGradientAngle = 0
          FrameColor = clBtnText
          FrameColorAlpha = 0
          FrameRadius = 5
          GlowEffect.Enabled = False
          GlowEffect.Color = clBtnShadow
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          AutoSize = False
          Layout = tlCenter
          Alignment = taCenter
          VertAlignment = scvtaCenter
          ShowEllipsis = True
          Caption = #21335#28891
        end
      end
    end
  end
  object SF_MinBox: TscStyledForm
    DWMClientShadow = True
    DWMClientShadowHitTest = False
    DropDownForm = False
    DropDownAnimation = False
    DropDownBorderColor = 2302755
    StylesMenuSorted = False
    ShowStylesMenu = False
    StylesMenuCaption = 'Styles'
    ClientWidth = 0
    ClientHeight = 0
    ShowHints = False
    Buttons = <>
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    CaptionAlignment = taLeftJustify
    InActiveClientColor = 2302755
    InActiveClientColorAlpha = 255
    InActiveClientBlurAmount = 0
    Tabs = <>
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clWindowText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    ShowIcon = False
    ShowButtons = False
    ShowTabs = True
    TabIndex = 0
    TabsPosition = sctpLeft
    ShowInactiveTab = False
    CaptionWallpaperIndex = -1
    CaptionWallpaperInActiveIndex = -1
    CaptionWallpaperLeftMargin = 1
    CaptionWallpaperTopMargin = 1
    CaptionWallpaperRightMargin = 1
    CaptionWallpaperBottomMargin = 1
    Left = 10
    Top = 9
  end
end
