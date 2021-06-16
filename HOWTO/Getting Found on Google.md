Getting Found on Google
=======================

Table of Contents
-----------------

* * [Step 1: Pick a Nice Domain](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-1-pick-a-nice-domain)
  * [Step 2: Research Your Domain](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-2-research-your-domain)
  * [Step 3: Verify your website on Google Search Console](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-3-verify-your-website-on-google-search-console)
  * [Step 4: Create Effective Title and Meta Tags](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-4-create-effective-title-and-meta-tags)
  * [Step 5: Create Rich Content](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-5-create-rich-content)
  * [Step 6: Link, Link, Link!](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#step-6-link-link-link)
  * [Oh and and another thing…](https://www.techblog.moebius.space/posts/how-to-get-your-site-on-google/#oh-and-and-another-thing)

I know what you’re thinking - how hard can it be to get your site on Google? Can’t I just pay some internet wizard to sprinkle some SEO fairy dust and make my site appear at the top of the searches?

You probably could.

But hey, call me old fashioned - but I like to know exactly how I achieved something, and I’d like to have played some part in it. Even if that part just just involves me supplying google with a whole bunch of my data.

So off I went on my merry way and tried to get some organic search results for this blog. Who knows if I was successful - you can be the judge of that. My objective was not to quit my job and sail to the bahamas. It was to try and understand just a little bit more about how the jungle that we call the internet works.

Step 1: Pick a Nice Domain
--------------------------

It seems intuitive to think that all domains are created equally. And [Google Webmaster](https://webmasters.googleblog.com/2015/07/googles-handling-of-new-top-level.html) claims that the [gTLD’s](https://en.wikipedia.org/wiki/Generic_top-level_domain) are at leasr treated equally when it comes to search rankings. Since the release of a slew of new TLDs (Top Level Domains) not restricted to country codes, many have been snatched up by scammers and spammers due to their relative cheapness. I too have jumped on this gTLD bandwagon (not because i’m a spammer), due to the fact that I am always looking for a sweet sweet deal. Wikipedia claims that “.space” is owned by a Radix Registry, and that the target market is:

> as a creative space

However, if you don’t trust Google and you think they secretly discriminate against spammy TLD’s or some [other websites may](https://www.domainregistration.com.au/news/2015/1509-shady-domains.php) - you can check the reputation of your TLD [here](https://www.spamhaus.org/statistics/tlds/).

As of 2018, it seems like .space has a TLD result of:

`space = 5.8% bad (score 0.44)`

Meaning, 5.8% of people using .space are really bad people that hurt kittens.

OK, so assuming you can pick whatever TLD you want, the subdomain will most definitely have an impact on your search results. For example, the custom domain you pick or buy from a registrar may have had a previous owner. And it pays to do some due dilligence to determine the reputation of the domain before purchasing it.

Step 2: Research Your Domain
----------------------------

* Perform a `site:`your-domain-name.com Google search. If there are no results this is usually a bad sign, as Google may have marked the domain with abad reputation. However, this can also mean that you have just purchased a brand new domain which no-one else has owned. Google also does not index parked domains, so if the domain was owned but never used - this will also not show up in searches.
* Perform a search on just the domain name (without the tld). If very few results show up, or the results are dodgy - this means that Google has likely demoted this search term due to abuse or some other reason.
* Perform a search on [the wayback machine](https://archive.org/web/). This will let you know if the domain was ever used for dodgy purposes.

For example, when this blog became live - I was greeted with this:

Step 3: Verify your website on Google Search Console
----------------------------------------------------

If you have a google account, you can increase the searchability of your website by providing Google with details about your website.

[Google Search Console](https://support.google.com/webmasters/answer/6332964?hl=en&ref_topic=4564315) has a number of excellent steps you can follow to increase searchability. The following is a summary:

* Add your website (including all aliases such as the www and non-www version) to the Search console.
* Verify your website: \> Verification proves that you are the owner of the website

Following these steps will not increase your PageRank, but it will at least ensure that Google indexes your website and knows about you. In my case, I went from zero to something.

Step 4: Create Effective Title and Meta Tags
--------------------------------------------

The more easily you provide content on your website for Google to index, the more readily your pages (might) appear in search results. One of the key things to do are to write descripting and effective `<meta>` and `<title>` tags. [Google Webmasters](https://support.google.com/webmasters/answer/35624#3) provide excellent tips for this. To summarize:

* Every page on your website has a title specified in `<title>` tag
* Try and be both descriptive, concise and unqiue. If the title is too long, it will be truncated. Otherwise it will be generic and not unique eneough.
* Try not to use too many keywords, especially duplicate ones or partial duplicates.
* Include your website name in the title, but don’t re-use the same title in every page.
* Every page should have a `meta` description which is unique.
* Meta descriptions can contain tags which can list specific data, such as:

```
\<meta name="Description" content="Company: Legs Akimbo, Established: 1995, CEO: Swan Lake, Category: Stockings"\>

```

Step 5: Create Rich Content
---------------------------

Rich content is essentially some additional metadata you provide on your pages which lets Google interpret the content of the pages into different contexts. As explained by Google:

> Google Search works hard to understand the content of a page. You can help us by providing explicit clues about the meaning of a page to Google by including structured data on the page. Structured data is a standardized format for providing information about a page and classifying the page content; for example, on a recipe page, what are the ingredients, the cooking time and temperature, the calories, and so on.

Details of this standardised structured format can be found at [schema.org](http://schema.org/), or [here](https://developers.google.com/search/docs/guides/intro-structured-data?visit_id=1-636529001530560738-3613461186&hl=en&rd=1).

You can specify this metadata as part of your content, as shown below using the `itemprop`, `itemtype` and `itemscope` attributes within any element. More details on how to use these can be found on the [Schema.org Getting Started Page](http://schema.org/docs/gs.html). But essentially, `itemscope` is used to specify that this element encloses a number of child properties known as `itemprop`’s, defined by a schema in `itemtype`. In my crude example below, a medical clinic has a property defined by `City` called `areaServed`, which contains the property name of Melbourne.

```
\<div class="col-lg-12"\>
    \<h2 class="mb-4"\>
        Specialist Medical Clinic in 
            \<span itemprop="areaServed" itemscope itemtype="http://schema.org/City"\>
                \<span itemprop="name"\>Melbourne \</span\>
            \</span\>
    \</h2\>
\</div\>

```

Google may prioritize this page on location or region searches involving Melbourne, or for users searching from the same region.

Inline html peoperties can be an absolute pain to maintain however, especially if your content changes regularly. Whenever you add new content, or modify existing ones, you also need to remember to update the schema metadata. You also need to ensure that you don’t break the structure of the metadata, or else Google will be unable to use it. This can be hard to debug - since it causes no visible changes to your website. However Google provides a neat [editor/tool](https://search.google.com/structured-data/testing-tool) to verify the structure of your content - and build new content.

An alternative approach to inline html properties would be to use the [JSON-LD](https://json-ld.org/) format to specify the metadata. The advantage of using this is that the metadata is loosely coupled with the content of the page, and can be defined in a separate script tag for the whole page. For example, to define something similar to our previous example:

```
\<script type="application/ld+json"\> { "@context": "http://schema.org", "@type": "City" "areaServed" { "@type": "name" } } \</script 
```

We could bundle up all the metadata for our pages into one script tag, and serve this from a separate html page using iframes, or re-use the same scripts on multiple pages. You can see that defining JSON-LD’s is a lot more flexible and easier to maintain than inline html properties.

Step 6: Link, Link, Link!
-------------------------

This may be obvious for many of the internet junkies out there, but Google’s search results are ranked based on the PageRank algorithm:

> PageRank works by counting the number and quality of links to a page to determine a rough estimate of how important the website is. The underlying assumption is that more important websites are likely to receive more links from other websites.

So, it’s time to link up!

```
\# My link game be strong (jks)
moebius@debbie:~/Code/techblog-moebius$ grep -r "href" public/ | grep -v "192.168" | grep -v 'href="/' | wc -l
OVER 9000!!!!

```

However, it’s not enough to just link out to as many sites as possible. Other sites need to also link to yours. And the more reputable(or important according to PageRank) these other sites are - the higher your page will rank. Since I prefer to keep to myself in the dark blue shades of my own website, you won’t see me on Google anytime soon.

Oh and and another thing…
-------------------------

If you are running a business - you may benefit from setting up a [Google Business Page](https://www.google.com/business/) and verifying your address. Your business will appear in any Google Maps searches in that region, along with any rich content you have specified (such as phone number, opening hours etc.). In fact Google have got so fancy - you can even create a simple static websie from the details you provide. Pretty Nifty.