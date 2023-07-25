function getMetaContentUsingRegex(data, link){
    const parser = new DOMParser();
    const doc = parser.parseFromString(data, 'text/html');

    const ogImageElement = doc.querySelector('meta[property="og:image"]');
    const ogImage = ogImageElement ? ogImageElement.getAttribute('content') : null;
    link.image_url = ogImage ?? link.image_url;
    
    const ogSiteNameElement = doc.querySelector('meta[property="og:site_name"]');
    const ogSiteName = ogSiteNameElement ? ogSiteNameElement.getAttribute('content') : null;
    link.source_name = ogSiteName ?? link.source_name;

    const ogDescriptionElement = doc.querySelector('meta[property="og:description"]');
    const ogDescription = ogDescriptionElement ? ogDescriptionElement.getAttribute('content') : null;
    link.description = ogDescription ?? link.description;

    return link;
}

async function getUrl() {
    const link = await new Promise((resolve, reject) => {
        chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
            const link = {
                "link": tabs[0].url,
                "title": tabs[0].title,
                "description": tabs[0].title,
                "source_name": new URL(tabs[0].url).hostname,
                "source_image_url": tabs[0].favIconUrl,
                "image_url": '',
            }
            fetch(tabs[0].url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Error`);
                    }
                    return response.text();
                })
                .then(data => {
                    l = getMetaContentUsingRegex(data,link)
                    resolve(l)
                })
                .catch(error => {
                    resolve(link)
                });
        });
    })

    return JSON.stringify(link)

}
