//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

/**
  Add missing static vars for values returned by String.availableStringEncodings. Names match
  CFStringEncodings
 */
public extension String.Encoding {
    
    /// Japanese (Mac OS)
    public static let macJapanese = String.Encoding(rawValue: 2147483649)
    
    /// Traditional Chinese (Mac OS)
    public static let macTraditional = String.Encoding(rawValue: 2147483650)
    
    /// Korean (Mac OS)
    public static let macKorean = String.Encoding(rawValue: 2147483651)
    
    /// Arabic (Mac OS)
    public static let macArabic = String.Encoding(rawValue: 2147483652)
    
    /// Hebrew (Mac OS)
    public static let macHebrew = String.Encoding(rawValue: 2147483653)
    
    /// Greek (Mac OS)
    public static let macGreek = String.Encoding(rawValue: 2147483654)
    
    /// Cyrillic (Mac OS)
    public static let macCyrillic = String.Encoding(rawValue: 2147483655)
    
    /// Devanagari (Mac OS)
    public static let macDevanagari = String.Encoding(rawValue: 2147483657)
    
    /// Gurmukhi (Mac OS)
    public static let macGurmukhi = String.Encoding(rawValue: 2147483658)
    
    /// Gujarati (Mac OS)
    public static let macGujarati = String.Encoding(rawValue: 2147483659)
    
    /// Thai (Mac OS)
    public static let macThai = String.Encoding(rawValue: 2147483669)
    
    /// Simplified Chinese (Mac OS)
    public static let macSimplified = String.Encoding(rawValue: 2147483673)
    
    /// Tibetan (Mac OS)
    public static let macTibetan = String.Encoding(rawValue: 2147483674)
    
    /// Central European (Mac OS)
    public static let macCentral = String.Encoding(rawValue: 2147483677)
    
    /// Dingbats (Mac OS)
    public static let macDingbats = String.Encoding(rawValue: 2147483682)
    
    /// Turkish (Mac OS)
    public static let macTurkish = String.Encoding(rawValue: 2147483683)
    
    /// Croatian (Mac OS)
    public static let macCroatian = String.Encoding(rawValue: 2147483684)
    
    /// Icelandic (Mac OS)
    public static let macIcelandic = String.Encoding(rawValue: 2147483685)
    
    /// Romanian (Mac OS)
    public static let macRomanian = String.Encoding(rawValue: 2147483686)
    
    /// Celtic (Mac OS)
    public static let macCeltic = String.Encoding(rawValue: 2147483687)
    
    /// Gaelic (Mac OS)
    public static let macGaelic = String.Encoding(rawValue: 2147483688)
    
    /// Keyboard Symbols (Mac OS)
    public static let macKeyboard = String.Encoding(rawValue: 2147483689)
    
    /// Farsi (Mac OS)
    public static let macFarsi = String.Encoding(rawValue: 2147483788)
    
    /// Cyrillic (Mac OS Ukrainian)
    public static let macUkrainian = String.Encoding(rawValue: 2147483800)
    
    /// Inuit (Mac OS)
    public static let macInuit = String.Encoding(rawValue: 2147483884)
    
    /// Western (ISO Latin 3)
    public static let isoLatin3 = String.Encoding(rawValue: 2147484163)
    
    /// Central European (ISO Latin 4)
    public static let isoLatin4 = String.Encoding(rawValue: 2147484164)
    
    /// Cyrillic (ISO 8859-5)
    public static let isoLatinCyrillic = String.Encoding(rawValue: 2147484165)
    
    /// Arabic (ISO 8859-6)
    public static let isoLatinArabic = String.Encoding(rawValue: 2147484166)
    
    /// Greek (ISO 8859-7)
    public static let isoLatinGreek = String.Encoding(rawValue: 2147484167)
    
    /// Hebrew (ISO 8859-8)
    public static let isoLatinHebrew = String.Encoding(rawValue: 2147484168)
    
    /// Turkish (ISO Latin 5)
    public static let isoLatin5 = String.Encoding(rawValue: 2147484169)
    
    /// Nordic (ISO Latin 6)
    public static let isoLatin6 = String.Encoding(rawValue: 2147484170)
    
    /// Thai (ISO 8859-11)
    public static let isoLatinThai = String.Encoding(rawValue: 2147484171)
    
    /// Baltic (ISO Latin 7)
    public static let isoLatin7 = String.Encoding(rawValue: 2147484173)
    
    /// Celtic (ISO Latin 8)
    public static let isoLatin8 = String.Encoding(rawValue: 2147484174)
    
    /// Western (ISO Latin 9)
    public static let isoLatin9 = String.Encoding(rawValue: 2147484175)
    
    /// Romanian (ISO Latin 10)
    public static let isoLatin10 = String.Encoding(rawValue: 2147484176)
    
    /// Latin-US (DOS)
    public static let dosLatinUS = String.Encoding(rawValue: 2147484672)
    
    /// Greek (DOS)
    public static let dosGreek = String.Encoding(rawValue: 2147484677)
    
    /// Baltic (DOS)
    public static let dosBalticRim = String.Encoding(rawValue: 2147484678)
    
    /// Western (DOS Latin 1)
    public static let dosLatin1 = String.Encoding(rawValue: 2147484688)
    
    /// Greek (DOS Greek 1)
    public static let dosGreek1 = String.Encoding(rawValue: 2147484689)
    
    /// Central European (DOS Latin 2)
    public static let dosLatin2 = String.Encoding(rawValue: 2147484690)
    
    /// Cyrillic (DOS)
    public static let dosCyrillic = String.Encoding(rawValue: 2147484691)
    
    /// Turkish (DOS)
    public static let dosTurkish = String.Encoding(rawValue: 2147484692)
    
    /// Portuguese (DOS)
    public static let dosPortuguese = String.Encoding(rawValue: 2147484693)
    
    /// Icelandic (DOS)
    public static let dosIcelandic = String.Encoding(rawValue: 2147484694)
    
    /// Hebrew (DOS)
    public static let dosHebrew = String.Encoding(rawValue: 2147484695)
    
    /// Canadian French (DOS)
    public static let dosCanadianFrench = String.Encoding(rawValue: 2147484696)
    
    /// Arabic (DOS)
    public static let dosArabic = String.Encoding(rawValue: 2147484697)
    
    /// Nordic (DOS)
    public static let dosNordic = String.Encoding(rawValue: 2147484698)
    
    /// Russian (DOS)
    public static let dosRussian = String.Encoding(rawValue: 2147484699)
    
    /// Greek (DOS Greek 2)
    public static let dosGreek2 = String.Encoding(rawValue: 2147484700)
    
    /// Thai (Windows, DOS)
    public static let dosThai = String.Encoding(rawValue: 2147484701)
    
    /// Simplified Chinese (Windows, DOS)
    public static let dosChineseSimplif = String.Encoding(rawValue: 2147484705)
    
    /// Korean (Windows, DOS)
    public static let dosKorean = String.Encoding(rawValue: 2147484706)
    
    /// Traditional Chinese (Windows, DOS)
    public static let dosChineseTrad = String.Encoding(rawValue: 2147484707)
    
    /// Hebrew (Windows)
    public static let windowsHebrew = String.Encoding(rawValue: 2147484933)
    
    /// Arabic (Windows)
    public static let windowsArabic = String.Encoding(rawValue: 2147484934)
    
    /// Baltic (Windows)
    public static let windowsBalticRim = String.Encoding(rawValue: 2147484935)
    
    /// Vietnamese (Windows)
    public static let windowsVietnamese = String.Encoding(rawValue: 2147484936)
    
    /// Japanese (Shift JIS X0213)
    public static let shiftJIS_X0213 = String.Encoding(rawValue: 2147485224)
    
    /// Chinese (GBK)
    public static let GBK_95 = String.Encoding(rawValue: 2147485233)
    
    /// Chinese (GB 18030)
    public static let GB_18030_2000 = String.Encoding(rawValue: 2147485234)
    
    /// Japanese (ISO 2022-JP-2)
    public static let ISO_2022_JP_2 = String.Encoding(rawValue: 2147485729)
    
    /// Japanese (ISO 2022-JP-1)
    public static let ISO_2022_JP_1 = String.Encoding(rawValue: 2147485730)
    
    /// Chinese (ISO 2022-CN)
    public static let ISO_2022_CN = String.Encoding(rawValue: 2147485744)
    
    /// Korean (ISO 2022-KR)
    public static let ISO_2022_KR = String.Encoding(rawValue: 2147485760)
    
    /// Simplified Chinese (GB 2312)
    public static let EUC_CN = String.Encoding(rawValue: 2147486000)
    
    /// Traditional Chinese (EUC)
    public static let EUC_TW = String.Encoding(rawValue: 2147486001)
    
    /// Korean (EUC)
    public static let EUC_KR = String.Encoding(rawValue: 2147486016)
    
    /// Japanese (Shift JIS)
    public static let shiftJIS_plain = String.Encoding(rawValue: 2147486209)
    
    /// Cyrillic (KOI8-R)
    public static let KOI8_R = String.Encoding(rawValue: 2147486210)
    
    /// Traditional Chinese (Big 5)
    public static let big5 = String.Encoding(rawValue: 2147486211)
    
    /// Western (Mac Mail)
    public static let macRomanLatin1 = String.Encoding(rawValue: 2147486212)
    
    /// Simplified Chinese (HZ GB 2312)
    public static let HZ_GB_2312 = String.Encoding(rawValue: 2147486213)
    
    /// Traditional Chinese (Big 5 HKSCS)
    public static let big5_HKSCS_1999 = String.Encoding(rawValue: 2147486214)
    
    /// Ukrainian (KOI8-U)
    public static let KOI8_U = String.Encoding(rawValue: 2147486216)
    
    /// Traditional Chinese (Big 5-E)
    public static let big5_E = String.Encoding(rawValue: 2147486217)
    
    /// Western (EBCDIC Latin Core)
    public static let EBCDIC_US = String.Encoding(rawValue: 2147486721)
    
    /// Western (EBCDIC Latin 1)
    public static let EBCDIC_CP037 = String.Encoding(rawValue: 2147486722)

    /// Unicode (UTF-7)
    public static let UTF7 = String.Encoding(rawValue: 2214592768)
}
