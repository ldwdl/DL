package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092600600422";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCAO1/wgMJMFKkkeZMT1zO8yLTCr5Rw9cQZLlpN0ix8GzuDJnEM12aURpeKwIaAfTdCSkKpRXub0UQ73V6HnVhYQkZtbwVlCDUuE9zdemQlXnXOolgrY4NJ5aYW8FrSZTeswSJ2+FRSfvwSJ9S/s0KCw6OeDPEMFSuBbTlnUpzbpZ3SHc1hfo5PvtS9gnmZtAiRNP/zmA/yqSZ0wFkNvpaWYwVRRCGOba1tvEEczZv+0pnW5yien7TRcwwUWiEPMFxbPj4dOHstMT60elwqXRJ46hpFGDcXEFmEVYShDJ0Kei6jz9gWSL0yLqo+GHxEZE1Jn+WtM2M85+WpcsobfdjxAgMBAAECggEALc6H+A7W2Xyr60aunnDKn46G2+ECwtNYSLKBOblxgKftu2zZB4BOuXr6GWuq4G1adwi2BWe3vzKjEEuEwCcZ7vVF2UPGho/HB3268TcOXTcAGF9v5Zf3x0cM7LbRisTzfXfEiwEshgesngOygQRVJwciBIyU8v8A+ov87IbbV66xEq69VXzkBkVdaEsDbp0DEZ2kBsvm5Tsxhl7qOOTEUrIrqF99oINixRDf7n7L1tgitbPImHnIA1/5rBkL6wOHc3t18K5SHZ/KtoOTqdTGe9pcdDq7TmsgFG6ZP76Yg01NDGm8Tmy4f4KOhkf/+LCk8cRVNa5kx8rmzgqTtHIOrQKBgQDB4h2M8s/SNVGF2+RWSKoGxT4T7/MwLXd/Wm+Qin8cEZ4IuEJkLD54qGifolE07m4GsleU/cgJX2FYXnjJcgebDQ11yn/CYqNec2dWbI//8Ov8MBU1aMd1ngLm02d4r4aQbqhfoBY6xEVqUQn732gO0ozxgC3oxKWnrXp/fDCJJwKBgQCpUK38vfWFxrcOt+KSh6ebLPCHYqMuuw5j0wZ5JfjmytBa8zroentdk02Eo4RkdyZN/dAJEVO2GwP3ko1fOVmsYCswqeSNOgbj6gGlDKYV5z0LlaCmqrnjLAEWnBmkGXPtAjMFYTOlx58cHZSgu5WDbYkhAmPahWJfp2Ic0K/sJwKBgGZJM4vbwfZFeNfk9Wbr+P+Pabu8+JCvO/7tKDSaTIrzZGt3Qld03BRtzJyDVtJVA6j2x6vr42/GaSXk2VZ1mTucvEArcBGOVmALBDadGa9OXEF04IuH1srfbOp4F3udJqHmL2Abpf6k83YugNTnvQ8s13zFQfMuY7K9nAXL8BM7AoGABgMGWn4INLrMjyo6UkeczOa4l6YJ80PTC/pXNYACqXc0FLakNdL7hGQRkY8YyVRtuME1XM0PstyctHKwsFvh8jvr7KtroRQZYIhTjJ+5Wfe+9CVY8fIH7agHVd0vD+OTeSvl0eAUrGM9JAts1pQyh9sgzlo+X2jzCEByPGGwjWsCgYEAndwkrGs+18dHf6DnnXDUXw6Sujc4cJJZ0vfs2MVccEeVNf8m06nwnZZtpCzRvEPAKfsW3+wd6rGJvzBZcIgCDs5MwOagLrt37Psf5fxZb4ccxYLDpxDeeHbTFXEOaPomQAnAXxIi7bMOvH9Nsn7dWVvxvvB6M6Tp2xwFBLXhBdc=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApgNS9OCODXRh6E+KXGxEk+ejCSDXRDWy88/BNnlTethEwnh5fAvLhEi1CuFA+3H/YuAI0ouAmCC4wY3WpF7F2bIknh2ppFT5JWAk9E5/7GUVE77k0yFp3C8CrfuifMx2gqLB9wOJi/2t/6nWVddCZTSpxms9gbb2z7setYXCEF9SbOM1Weo8/LJC2PGOdlqZ98+Z+lhnvXCo8VtW3vpG2Th9i/iEMNMdI4DBBAbhqA1ebeWgkapz5cIAj0pFybFoCNC4/sJ2shvDJojWM6HszMll8MShgPvJWMyZfr6bdaMPAEuKIErw9LOuj5txpbufRl1MAs5D/IJDX3rp1axlcwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/DLSMS/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/DLSMS/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

