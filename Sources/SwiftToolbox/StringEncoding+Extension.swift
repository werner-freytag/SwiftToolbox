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
    static let macJapanese = String.Encoding(rawValue: 2147483649)
    
    /// Traditional Chinese (Mac OS)
    static let macTraditional = String.Encoding(rawValue: 2147483650)
    
    /// Korean (Mac OS)
    static let macKorean = String.Encoding(rawValue: 2147483651)
    
    /// Arabic (Mac OS)
    static let macArabic = String.Encoding(rawValue: 2147483652)
    
    /// Hebrew (Mac OS)
    static let macHebrew = String.Encoding(rawValue: 2147483653)
    
    /// Greek (Mac OS)
    static let macGreek = String.Encoding(rawValue: 2147483654)
    
    /// Cyrillic (Mac OS)
    static let macCyrillic = String.Encoding(rawValue: 2147483655)
    
    /// Devanagari (Mac OS)
    static let macDevanagari = String.Encoding(rawValue: 2147483657)
    
    /// Gurmukhi (Mac OS)
    static let macGurmukhi = String.Encoding(rawValue: 2147483658)
    
    /// Gujarati (Mac OS)
    static let macGujarati = String.Encoding(rawValue: 2147483659)
    
    /// Thai (Mac OS)
    static let macThai = String.Encoding(rawValue: 2147483669)
    
    /// Simplified Chinese (Mac OS)
    static let macSimplified = String.Encoding(rawValue: 2147483673)
    
    /// Tibetan (Mac OS)
    static let macTibetan = String.Encoding(rawValue: 2147483674)
    
    /// Central European (Mac OS)
    static let macCentral = String.Encoding(rawValue: 2147483677)
    
    /// Dingbats (Mac OS)
    static let macDingbats = String.Encoding(rawValue: 2147483682)
    
    /// Turkish (Mac OS)
    static let macTurkish = String.Encoding(rawValue: 2147483683)
    
    /// Croatian (Mac OS)
    static let macCroatian = String.Encoding(rawValue: 2147483684)
    
    /// Icelandic (Mac OS)
    static let macIcelandic = String.Encoding(rawValue: 2147483685)
    
    /// Romanian (Mac OS)
    static let macRomanian = String.Encoding(rawValue: 2147483686)
    
    /// Celtic (Mac OS)
    static let macCeltic = String.Encoding(rawValue: 2147483687)
    
    /// Gaelic (Mac OS)
    static let macGaelic = String.Encoding(rawValue: 2147483688)
    
    /// Keyboard Symbols (Mac OS)
    static let macKeyboard = String.Encoding(rawValue: 2147483689)
    
    /// Farsi (Mac OS)
    static let macFarsi = String.Encoding(rawValue: 2147483788)
    
    /// Cyrillic (Mac OS Ukrainian)
    static let macUkrainian = String.Encoding(rawValue: 2147483800)
    
    /// Inuit (Mac OS)
    static let macInuit = String.Encoding(rawValue: 2147483884)
    
    /// Western (ISO Latin 3)
    static let isoLatin3 = String.Encoding(rawValue: 2147484163)
    
    /// Central European (ISO Latin 4)
    static let isoLatin4 = String.Encoding(rawValue: 2147484164)
    
    /// Cyrillic (ISO 8859-5)
    static let isoLatinCyrillic = String.Encoding(rawValue: 2147484165)
    
    /// Arabic (ISO 8859-6)
    static let isoLatinArabic = String.Encoding(rawValue: 2147484166)
    
    /// Greek (ISO 8859-7)
    static let isoLatinGreek = String.Encoding(rawValue: 2147484167)
    
    /// Hebrew (ISO 8859-8)
    static let isoLatinHebrew = String.Encoding(rawValue: 2147484168)
    
    /// Turkish (ISO Latin 5)
    static let isoLatin5 = String.Encoding(rawValue: 2147484169)
    
    /// Nordic (ISO Latin 6)
    static let isoLatin6 = String.Encoding(rawValue: 2147484170)
    
    /// Thai (ISO 8859-11)
    static let isoLatinThai = String.Encoding(rawValue: 2147484171)
    
    /// Baltic (ISO Latin 7)
    static let isoLatin7 = String.Encoding(rawValue: 2147484173)
    
    /// Celtic (ISO Latin 8)
    static let isoLatin8 = String.Encoding(rawValue: 2147484174)
    
    /// Western (ISO Latin 9)
    static let isoLatin9 = String.Encoding(rawValue: 2147484175)
    
    /// Romanian (ISO Latin 10)
    static let isoLatin10 = String.Encoding(rawValue: 2147484176)
    
    /// Latin-US (DOS)
    static let dosLatinUS = String.Encoding(rawValue: 2147484672)
    
    /// Greek (DOS)
    static let dosGreek = String.Encoding(rawValue: 2147484677)
    
    /// Baltic (DOS)
    static let dosBalticRim = String.Encoding(rawValue: 2147484678)
    
    /// Western (DOS Latin 1)
    static let dosLatin1 = String.Encoding(rawValue: 2147484688)
    
    /// Greek (DOS Greek 1)
    static let dosGreek1 = String.Encoding(rawValue: 2147484689)
    
    /// Central European (DOS Latin 2)
    static let dosLatin2 = String.Encoding(rawValue: 2147484690)
    
    /// Cyrillic (DOS)
    static let dosCyrillic = String.Encoding(rawValue: 2147484691)
    
    /// Turkish (DOS)
    static let dosTurkish = String.Encoding(rawValue: 2147484692)
    
    /// Portuguese (DOS)
    static let dosPortuguese = String.Encoding(rawValue: 2147484693)
    
    /// Icelandic (DOS)
    static let dosIcelandic = String.Encoding(rawValue: 2147484694)
    
    /// Hebrew (DOS)
    static let dosHebrew = String.Encoding(rawValue: 2147484695)
    
    /// Canadian French (DOS)
    static let dosCanadianFrench = String.Encoding(rawValue: 2147484696)
    
    /// Arabic (DOS)
    static let dosArabic = String.Encoding(rawValue: 2147484697)
    
    /// Nordic (DOS)
    static let dosNordic = String.Encoding(rawValue: 2147484698)
    
    /// Russian (DOS)
    static let dosRussian = String.Encoding(rawValue: 2147484699)
    
    /// Greek (DOS Greek 2)
    static let dosGreek2 = String.Encoding(rawValue: 2147484700)
    
    /// Thai (Windows, DOS)
    static let dosThai = String.Encoding(rawValue: 2147484701)
    
    /// Simplified Chinese (Windows, DOS)
    static let dosChineseSimplif = String.Encoding(rawValue: 2147484705)
    
    /// Korean (Windows, DOS)
    static let dosKorean = String.Encoding(rawValue: 2147484706)
    
    /// Traditional Chinese (Windows, DOS)
    static let dosChineseTrad = String.Encoding(rawValue: 2147484707)
    
    /// Hebrew (Windows)
    static let windowsHebrew = String.Encoding(rawValue: 2147484933)
    
    /// Arabic (Windows)
    static let windowsArabic = String.Encoding(rawValue: 2147484934)
    
    /// Baltic (Windows)
    static let windowsBalticRim = String.Encoding(rawValue: 2147484935)
    
    /// Vietnamese (Windows)
    static let windowsVietnamese = String.Encoding(rawValue: 2147484936)
    
    /// Japanese (Shift JIS X0213)
    static let shiftJIS_X0213 = String.Encoding(rawValue: 2147485224)
    
    /// Chinese (GBK)
    static let GBK_95 = String.Encoding(rawValue: 2147485233)
    
    /// Chinese (GB 18030)
    static let GB_18030_2000 = String.Encoding(rawValue: 2147485234)
    
    /// Japanese (ISO 2022-JP-2)
    static let ISO_2022_JP_2 = String.Encoding(rawValue: 2147485729)
    
    /// Japanese (ISO 2022-JP-1)
    static let ISO_2022_JP_1 = String.Encoding(rawValue: 2147485730)
    
    /// Chinese (ISO 2022-CN)
    static let ISO_2022_CN = String.Encoding(rawValue: 2147485744)
    
    /// Korean (ISO 2022-KR)
    static let ISO_2022_KR = String.Encoding(rawValue: 2147485760)
    
    /// Simplified Chinese (GB 2312)
    static let EUC_CN = String.Encoding(rawValue: 2147486000)
    
    /// Traditional Chinese (EUC)
    static let EUC_TW = String.Encoding(rawValue: 2147486001)
    
    /// Korean (EUC)
    static let EUC_KR = String.Encoding(rawValue: 2147486016)
    
    /// Japanese (Shift JIS)
    static let shiftJIS_plain = String.Encoding(rawValue: 2147486209)
    
    /// Cyrillic (KOI8-R)
    static let KOI8_R = String.Encoding(rawValue: 2147486210)
    
    /// Traditional Chinese (Big 5)
    static let big5 = String.Encoding(rawValue: 2147486211)
    
    /// Western (Mac Mail)
    static let macRomanLatin1 = String.Encoding(rawValue: 2147486212)
    
    /// Simplified Chinese (HZ GB 2312)
    static let HZ_GB_2312 = String.Encoding(rawValue: 2147486213)
    
    /// Traditional Chinese (Big 5 HKSCS)
    static let big5_HKSCS_1999 = String.Encoding(rawValue: 2147486214)
    
    /// Ukrainian (KOI8-U)
    static let KOI8_U = String.Encoding(rawValue: 2147486216)
    
    /// Traditional Chinese (Big 5-E)
    static let big5_E = String.Encoding(rawValue: 2147486217)
    
    /// Western (EBCDIC Latin Core)
    static let EBCDIC_US = String.Encoding(rawValue: 2147486721)
    
    /// Western (EBCDIC Latin 1)
    static let EBCDIC_CP037 = String.Encoding(rawValue: 2147486722)

    /// Unicode (UTF-7)
    static let UTF7 = String.Encoding(rawValue: 2214592768)
}
