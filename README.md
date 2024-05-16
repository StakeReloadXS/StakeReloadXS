# 📝**[Version 1.5.4 Updates: ](https://github.com/StakeReloadXS/StakeReloadXS/releases/tag/1.5.4)[Latest](https://github.com/StakeReloadXS/StakeReloadXS/releases/latest)**
**May 14, 2024**

## ❤️**ReloadXS 1.5.4 Updates❤️**
### Updates:
- Implement additional support for Turbo Captcha.
- Soon we will release a support channel since we have a lot of requests to different members of staff. More on this later.
- Fix misplaced code that causing bot to crash after a long run.
- Fix refund captcha when using xsid, was refunded to account instead of XSID.
- Fix /vipclub server was down for a while.
- Bot will retry request up to 3 time when receiving "Unknown Error xxxxxxx" message from Stake.
- Bot will reject same code that coming before 10 seconds passed, this may avoid Rate Limit when we accidentally input the code twice.

### 🎮**Type of Captcha:**
- Normal Captcha 6-60s = work anytime for all kind of captcha type.
- Turbo Captcha 2-6s = work anytime, only for code drops, requires XSID.
- Instant Captcha 0-2s = work on weekly stream, only for code drops, requires XSID.

### 🔗**URL Update:**
**stake.com/blog/vipclub** 

### 🪪**XSID**
With an XSID you only need to manage 1 credits system, top up 1 XSID only to use it for all your accounts.
>Later we will create a function to convert your remaining accounts credits to XSID credits.

### ⚙**Settings File:**
- We added settings.json, so you can preset your bot before starting it.
- **Auto Start:**
> Will load from accounts.json after connected to the server and then Start automatically.
- **XSID(optional but recommended):**
> Put your XSID and auto assign it after connected to the server.
- **Chat ID(optional):**
> Your telegram group ID for reports (see below).
- **Low Credits:**
> Invite [StakeReloadXS Assistant](https://t.me/srxs_bot) to a group on telegram and get the group ID from [Raw Group Info Bot](https://t.me/SimpleID_Bot) to stay up to date with event logs from your accounts.

> {
>   "auto_start": true,
>   "xsid": "XSID",
>   "chat_id": "-1001510831975",
>   "report_code_drops": true,
>   "report_reload_claims": true,
>   "auto_claim_reload": true,
>   "auto_vault_reload": false,
>   "auto_vault_drop": false,
>   "auto_claim_drop": true,
>   "xsid_low_credits_threshold": 1000,
>   "promo_code": "1000free"
> }_

## **⚡Instant Captcha**
Instant captcha feature can provide your captcha instantly without waiting for captcha provider, the only waiting time  is only between you and our server.
**More about this feature:**
- Require XSID with instant support to work
- Only available during weekly stream
- Not to be confused with StakeDropXS (also part of our line of products but they are distinctly different, and available for .com users only.)

## **Promocode:**
1000free

>_Note: Any new user who uses this will be credited a temporary balance for a no deposit trial amount._
Thank you, everyone, for your continued support.

## **All Features Version 1.5.0:**
- [ ] ✔️ Support across every OS including mobile (no mobile support for DropXS).
- [ ] ✔️ 🆕Store settings for fast startup.
- [ ] ✔️ 🆕Automatically start the bot.
- [ ] ✔️ 🆕Report bot events to telegram.
- [ ] ✔️ 🆕Completely Bypass captchas.
- [ ] ✔️ Multi account with ease.
- [ ] ✔️ Added security with Vaults.
- [ ] ✔️ Claim any drop, bonus, reload, or other manually.


### **Pricing💰v154:**
**COM🌐:**
- [ ] ➕ Reload Claim | 15 Credits
- [ ] ➕ Drop Claim | 300 Credits

**US⭐ NO DROP XS:**
- [ ] ➖ Daily Claim | 250 Credits
- [ ] ➖ Reload Claim | 15 Credits
- [ ] ➖ Drop Claim | 175 Credits

>_Note: Pricing Rates for this release._
## **How to Add Credits:**
> **⚠️WARNING⚠️ DO NOT TIP US ON STAKE. Tipping is no longer automatic to refill your balance!.**
- [ ] Contact on telegram [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2Fsp_stake&count_bg=%2379C83D&title_bg=%237FA1E0&icon=telegram.svg&icon_color=%23FFFFFF&title=%40sp_stake&edge_flat=false)](https://hits.seeyoufarm.com) OR [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2Fsupitsj&count_bg=%2379C83D&title_bg=%237FA1E0&icon=telegram.svg&icon_color=%23FFFFFF&title=%40SupItsJ&edge_flat=false)](https://hits.seeyoufarm.com) for batch of redeemable vouchers within the app. We now have [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fdsc.gg%2Freload-xs&count_bg=%2379C83D&title_bg=%236A9EFF&icon=discord.svg&icon_color=%23FFFFFF&title=Discord&edge_flat=false)](https://hits.seeyoufarm.com) also!
- [ ] $1 = 1000 credits, get 10% extra credits for transactions over $100.
- [ ] Credits will be added automatically and updated in next claim.
- [ ] In case credits are not added, please contact us on telegram [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2Fsp_stake&count_bg=%2379C83D&title_bg=%237FA1E0&icon=telegram.svg&icon_color=%23FFFFFF&title=%40sp_stake&edge_flat=false)](https://hits.seeyoufarm.com) OR [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2Fsupitsj&count_bg=%2379C83D&title_bg=%237FA1E0&icon=telegram.svg&icon_color=%23FFFFFF&title=%40SupItsJ&edge_flat=false)](https://hits.seeyoufarm.com) 
### **Best Practice:**
- [ ] Max 6 accounts per IP, less = more.
- [ ] Refresh every Friday or Saturday before 00:00 GMT.
- [ ] Avoid using VPNs when possible.
- [ ] Turn off Chrome memory saver.

### **How To Install:**
- [ ] Open your browser then type and enter on address bar chrome://extensions (or brave://extensions kiwi://extensions depends on what browser you use).
- [ ] Activate "Developer Mode" switch located on top right of the page.
- [ ] Click Load Unpacked located on top left of the page.
- [ ] Select StakeReloadXS folder that you have unzipped (for Kiwi browser, select the zipped file instead).
- [ ] If success, StakeReloadXS extension should be in your extensions list.
- [ ] Open new tab and go to stake.com/vipclub or stake.com/vvipclub (also works for any stake mirrors) - you should see page as shown in screenshot.
_Note: Follow [THIS](https://www.youtube.com/shorts/wScjw3U06I0) video step by step._
_Use /vipclub if your device IP near asia._
_Use /vvipclub if your device IP near europe._
_Use /svipclub (Singapore) - Access code required!_
_Use /xvipclub for any issues - Access code required!._

### Stats for Nerds:
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FStakeReloadXS%2FStakeReloadXS&count_bg=%2379C83D&title_bg=%23555555&icon=github.svg&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fdsc.gg%2Fplayxvip&count_bg=%2379C83D&title_bg=%236A9EFF&icon=discord.svg&icon_color=%23FFFFFF&title=playX+Discord&edge_flat=false)](https://hits.seeyoufarm.com) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2FStakeReloadXS&count_bg=%2379C83D&title_bg=%236A9EFF&icon=minutemailer.svg&icon_color=%23FFFFFF&title=Telegram&edge_flat=false)](https://hits.seeyoufarm.com) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fdsc.gg%2Freload-xs&count_bg=%2379C83D&title_bg=%236A9EFF&icon=discord.svg&icon_color=%23FFFFFF&title=Discord&edge_flat=false)](https://hits.seeyoufarm.com) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fx.com%2FReloadedXS&count_bg=%2379C83D&title_bg=%23000000&icon=nutanix.svg&icon_color=%23FFFFFF&title=on+X+%40ReloadedXS&edge_flat=false)](https://hits.seeyoufarm.com) 

## **Officials:**
- [ ] **Telegram:** [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2FStakeReloadXS&count_bg=%2379C83D&title_bg=%236A9EFF&icon=minutemailer.svg&icon_color=%23FFFFFF&title=Telegram&edge_flat=false)](https://hits.seeyoufarm.com)
- [ ] **Telegram Channel:** [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Ft.me%2FStakeReloadXS&count_bg=%2379C83D&title_bg=%236A9EFF&icon=minutemailer.svg&icon_color=%23FFFFFF&title=Telegram&edge_flat=false)](https://hits.seeyoufarm.com)
- [ ] **Discord:** [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fdsc.gg%2Freload-xs&count_bg=%2379C83D&title_bg=%236A9EFF&icon=discord.svg&icon_color=%23FFFFFF&title=Discord&edge_flat=false)](https://hits.seeyoufarm.com)
- [ ] **X:** [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fx.com%2FReloadedXS&count_bg=%2379C83D&title_bg=%23000000&icon=nutanix.svg&icon_color=%23FFFFFF&title=on+X+%40ReloadedXS&edge_flat=false)](https://hits.seeyoufarm.com) 
- [ ] **email:** [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Foutlook.com&count_bg=%2379C83D&title_bg=%23000000&icon=gmail.svg&icon_color=%23FFFFFF&title=E-mail+Us&edge_flat=false)](https://hits.seeyoufarm.com)
