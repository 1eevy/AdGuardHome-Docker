[![Docker Image CI](https://github.com/Dofamin/AdGuardHome-Docker/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/Dofamin/AdGuardHome-Docker/actions/workflows/docker-image.yml)
# AdGuard Home-Docker
AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

It operates as a DNS server that re-routes tracking domains to a "black hole", thus preventing your devices from connecting to those servers. It's based on software we use for our public [AdGuard DNS](https://adguard.com/en/adguard-dns/overview.html) servers -- both share a lot of common code.

* [Getting Started](#getting-started)
* [Comparing AdGuard Home to other solutions](#comparison)
    * [How is this different from public AdGuard DNS servers?](#comparison-adguard-dns)
    * [How does AdGuard Home compare to Pi-Hole](#comparison-pi-hole)
    * [How does AdGuard Home compare to traditional ad blockers](#comparison-adblock)
* [How to build from source](#how-to-build)
* [Contributing](#contributing)
    * [Test unstable versions](#test-unstable-versions)
    * [Reporting issues](#reporting-issues)
    * [Help with translations](#translate)
    * [Other](#help-other)
* [Projects that use AdGuard Home](#uses)
* [Acknowledgments](#acknowledgments)
* [Privacy](#privacy)

## Getting Started

### How does AdGuard Home compare to Pi-Hole

At this point, AdGuard Home has a lot in common with Pi-Hole. Both block ads and trackers using "DNS sinkholing" method, and both allow customizing what's blocked.

> We're not going to stop here. DNS sinkholing is not a bad starting point, but this is just the beginning.

AdGuard Home provides a lot of features out-of-the-box with no need to install and configure additional software. We want it to be simple to the point when even casual users can set it up with minimal effort.

> Disclaimer: some of the listed features can be added to Pi-Hole by installing additional software or by manually using SSH terminal and reconfiguring one of the utilities Pi-Hole consists of. However, in our opinion, this cannot be legitimately counted as a Pi-Hole's feature.

| Feature                                                                 | AdGuard&nbsp;Home | Pi-Hole                                                   |
|-------------------------------------------------------------------------|-------------------|-----------------------------------------------------------|
| Blocking ads and trackers                                               | ✅                | ✅                                                        |
| Customizing blocklists                                                  | ✅                | ✅                                                        |
| Built-in DHCP server                                                    | ✅                | ✅                                                        |
| HTTPS for the Admin interface                                           | ✅                | Kind of, but you'll need to manually configure lighttpd   |
| Encrypted DNS upstream servers (DNS-over-HTTPS, DNS-over-TLS, DNSCrypt) | ✅                | ❌ (requires additional software)                         |
| Cross-platform                                                          | ✅                | ❌ (not natively, only via Docker)                        |
| Running as a DNS-over-HTTPS or DNS-over-TLS server                      | ✅                | ❌ (requires additional software)                         |
| Blocking phishing and malware domains                                   | ✅                | ❌ (requires non-default blocklists)                      |
| Parental control (blocking adult domains)                               | ✅                | ❌                                                        |
| Force Safe search on search engines                                     | ✅                | ❌                                                        |
| Per-client (device) configuration                                       | ✅                | ✅                                                        |
| Access settings (choose who can use AGH DNS)                            | ✅                | ❌                                                        |
| Running [without root privileges](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started#running-without-superuser)                                         | ✅                | ❌                                                        |

### How does AdGuard Home compare to traditional ad blockers

It depends.

"DNS sinkholing" is capable of blocking a big percentage of ads, but it lacks flexibility and power of traditional ad blockers. You can get a good impression about the difference between these methods by reading [this article](https://adguard.com/en/blog/adguard-vs-adaway-dns66/). It compares AdGuard for Android (a traditional ad blocker) to hosts-level ad blockers (which are almost identical to DNS-based blockers in their capabilities). This level of protection is enough for some users. 

Additionally, using a DNS-based blocker can help to block ads, tracking and analytics requests on other types of devices, such as SmartTVs, smart speakers or other kinds of IoT devices (on which you can't install traditional ad blockers).

**Known limitations**

Here are some examples of what cannot be blocked by a DNS-level blocker:

* YouTube, Twitch ads
* Facebook, Twitter, Instagram sponsored posts

Essentially, any advertising that shares a domain with content cannot be blocked by a DNS-level blocker.

Is there a chance to handle this in the future? DNS will never be enough to do this. Our only option is to use a content blocking proxy like what we do in the standalone AdGuard applications. We're [going to bring](https://github.com/AdguardTeam/AdGuardHome/issues/1228) this feature support to AdGuard Home in the future. Unfortunately, even in this case, there still will be cases when this won't be enough or would require quite a complicated configuration.

## Privacy

Our main idea is that you are the one, who should be in control of your data. So it is only natural, that AdGuard Home does not collect any usage statistics, and does not use any web services unless you configure it to do so. Full policy with every bit that _could in theory be_ sent by AdGuard Home is available [here](https://adguard.com/en/privacy/home.html).

---

##### [Official AdGuardHome GitHub Repository](https://github.com/AdguardTeam/AdGuardHome)
