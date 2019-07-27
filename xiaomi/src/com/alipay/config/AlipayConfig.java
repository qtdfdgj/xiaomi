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
	public static String app_id = "2016101100660383";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDOvsDrfaeeswiUBB5/dZm+xvlcTduhAZOrphiZNyZ/VnxTELz16jO5UPoIj7LN3Uh48Sb9HLecVuaD9hOy6CzqIHW9j1D5PiRdlFSCFrxeEjyPvHYAP1wtd+pffzUOK9mqaMv7uzo8SiZbuvJgwOlG3Cica6z10Hn6AxWlIW5sRgq0o0cnDsvCjWj8mi83A4CpoWUFHYehaCuc2nwUJCHgutaf+v+0M4Fbh1UlmhZP0TIXlqDguhPHj3jEJdEUeaPwkE9EKp3zwsJPw4wVR3xwRBqNGm0T1qjq7UO+apELWoaEZ1HK4x6kN/8eGPPiwRXIFmBXYLcpmAyLFQRvX825AgMBAAECggEAO1+Svc5vRec6jm+EZqxaQ+yWjkiZy2pNg10G8XFiL+2hdKV47tKcmhrEQ5MpEW/8MSdoQAZwQIjAWKNh0t5Uj8RUq+Stp3aOMQW5I0buP8HS/KBt7vJDQZePim9YyEIVl5fTBO8m8UuGKo/MrbaZB82QKCPQHyQI86DRJYQtVxBePMOHxBFL/jToa19UyNK+QATuH2dPotjiBv/JFqqr8/ybsFSSDgqhG+RznLFEWu0LdjQt9tlMvIaN/SbjPfPMhM7yGiOPP7i2BuKBXf8x4EMvCCTfMEh2q2A7r+Z9UhnaQMInwavlS/0Otp1CigUDQRWMTnx86Bzjwi3bjPvYgQKBgQDnL8F3G9TlhXJD95w/M+vQm3sW9wZ/45aIufoXRX6QbHPRlpjUAzFL4dnELNnRvMARPKUCWW3FC3R+edZMqb6wAsr4W+nDIYiBWqp0oz3T1GUlqm08fdV82alQONX1cx8QGXKEURyQtkghCEgOC5EfHNsHLYcEhBhKj3Z1zSLqqQKBgQDk722o0lesRkLr41SwGFFbxJoi2eFX4ZyhtFjkJDEgy3+RH2o3u/1WXvvMEdWfQVd4wq7b9DfJvQ21e40IcD0MRI7MIGt9wPCvVAEbrrG5e4ZkHeL3hjC9BjjZ71iNfsDyMyD5cGwaScyFOpv8D+m/R+n6EpgTyFYK7bW9BKREkQKBgQCX8XIk11zwUOmNtDKz82r8WwPmTwqtiSYJzLmLC/in8S+Zw3HEfiirJ9AZOCUczQIrEgGdbqtPgzzYVzk6f6G9SsidvMMBpYtzAOTg7d0X2RN1UvKifE2Q1fmKqSAuRrBWw3LZdfnhPnxfgXLiEEYb/boSmKCRnkPc1TdVKzLUqQKBgBv/iCrAZsaD5UVSDRZoMvMFLVCb0upbhjtkggaMwpFfMd++ts/QJuB8R1Ei0Txj0l3LeXUe/f+nJlkOniXtDBpG/CvMvzim8wiOPoBzMfscN0hhO1PIToefji5hDjRnzxMP27WF4UKpyeB1VYRTMeQZ2Gyj/4NT2eoGPla6jZhxAoGAFpodCg5sk5KCT2nZNEZly3jxsie7guA4inerNJw2qSUVpN9aJoNOvZCs5Bnt0OLV4n2fviCH5LaBCYdRKAPtBsWKHLbtRjHHBSjCbyoOBrniqz6vKil0qbwJGGkgAZae9Kcoxow1VBr6SAaMN2uRlBKuedzGorOerRW4pIsKUGI=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmgzntnOuZgQbfQmOGJa2hwfg5jsoJKravyDYwjN4eW+Yvix+2L+tykNvJM+jBdrdbZWj8F59UlOLM9goouPPnMALVsuMToAepHD3JAH2RRve4Yrfs2g0arZ6wHkKfdSF/ZgXQsw0b+1giDnaWP/RZEjEED1HqNY/MH3uUUj9iFAUlVq1bfNlC2JemjHVJ0wGIat7YlL4eRbQ9fvElO7Cb746o+ObG4KoLDSh/6L56i96ZqB5KeT4zGH4n1B+SDpMbddkRCrumE6jPhMlDdyADdY7pLEc729J56mZK56FO7OgKVM3umY9fTD1+mZp35XoU5GNLpnO3nvrAM30+U/8kQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/xiaomi/AlipayServlet";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/xiaomi/OrderServlet?operate=pay_order";

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

