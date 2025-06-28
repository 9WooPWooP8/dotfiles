function FindProxyForURL(url, host) {
    // Proxy server (customize this line)
    var proxy = "PROXY 91.199.147.158:3128";

    // Domains related to ChatGPT/OpenAI
    var proxy_domains = [
        "chatgpt.com",
        "chat.openai.com",
        "openai.com",
        "api.openai.com",
        "platform.openai.com",
        "auth0.openai.com",

        "*.youtube.com",
        "youtube.com",
        "*.googlevideo.com",
        "googlevideo.com",
        "ytimg.com",
        "*.ytimg.com",
    ];

    for (var i = 0; i < proxy_domains.length; i++) {
        if (dnsDomainIs(host, proxy_domains[i]) || shExpMatch(host, "*." + proxy_domains[i])) {
            return proxy;
        }
    }

    // All other traffic goes direct
    return "DIRECT";
}

