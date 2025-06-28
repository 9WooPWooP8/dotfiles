function FindProxyForURL(url, host) {
    // Proxy server (customize this line)
    var proxy = "PROXY 91.199.147.158:3128";

    // Domains related to ChatGPT/OpenAI
    var chatgptDomains = [
        "chatgpt.com",
        "chat.openai.com",
        "openai.com",
        "api.openai.com",
        "platform.openai.com",
        "auth0.openai.com"
    ];

    for (var i = 0; i < chatgptDomains.length; i++) {
        if (dnsDomainIs(host, chatgptDomains[i]) || shExpMatch(host, "*." + chatgptDomains[i])) {
            return proxy;
        }
    }

    // All other traffic goes direct
    return "DIRECT";
}

