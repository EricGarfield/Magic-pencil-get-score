

#import <Foundation/Foundation.h>

@interface NSString (TMNSString)
/** 转换成xxxx年xx月 */
+ (NSString *)tm_conversionYearMonthWithDateStr:(NSString *)dateStr;
/** 读取选择的账本ID */
+ (NSString *)readUserDefaultOfSelectedBookID;
/** 返回当前时间格式字符串 XXXX年XX月XX日 */
+ (NSString *)currentDateStr;
@end
