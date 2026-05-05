<div align="center">
  <img src="BambuTag.png" width="500" alt="BambuTag-Logo">
</div>

**BambuTag** is a modern, lightweight Progressive Web App (PWA) that turns your smartphone into a handy NFC scanner. With this application, you can easily expand **BamBuddy** to scan or write NFC tags for filament spools directly using your mobile device, allowing you to assign them to printer AMS slots without needing a PC.

---

## 🚀 Features

- **In-Browser NFC Support:** Utilize your smartphone or NFC-capable device to scan or write NFC tags directly.
- **Seamless BamBuddy Integration:** Retrieve spool inventory data, colors, materials, and remaining weights directly from your Spoolman database.
- **Direct Assignment:** Assign scanned spools directly to your printers and AMS slots in BamBuddy.
- **Easy Configuration:** Settings for your server URL, API key, and optional proxies are stored directly within the user interface.
- **PWA:** Once loaded, the web app can be installed on your device's home screen for easy mobile use.

---

## ⚠️ Important Security Notice

Because this application does not use server-side authentication and stores your API keys locally in your browser (`localStorage`), it is highly recommended to run this application **only within your local network (LAN)** and not expose it to the public internet.

---

## 🌐 Network & Security Setup

To use BambuTag without any issues, specific technical requirements for HTTPS and CORS must be met.

### 1. NFC Support & HTTPS Requirement

* **Supported Browsers:** Ensure you are using an NFC-compatible browser (such as Chrome for Android).

* **Secure Connection:** Ensure you are creating a secure connection (HTTPS) since modern browser don't allow NFC for insecure sites. *(Certificate-errors don't mather as long as it's HTTPS)*

### 2. Preventing CORS Errors (Cross-Origin Resource Sharing)

If BambuTag and your BamBuddy instance run on different domains, ports, or IP addresses, modern browsers will block the API requests.

* **The Solution:** Set up an API Proxy.

* **Recommended API-Proxy:** [`testcab/cors-anywhere:latest`](https://hub.docker.com/r/testcab/cors-anywhere).


---

## 🐋 Docker Compose Configuration

### 1. Only BambuTag

```yaml
services:
  bambutag:
    image: ghcr.io/faioliii/bambutag:latest
    container_name: bambutag
    restart: unless-stopped
    ports:
      - "4080:80"
      - "4443:443"
```

### 2. BambuTag & API-Proxy

```yaml
services:
  apiproxy:
    image: 	testcab/cors-anywhere:latest
    container_name: apiproxy
    restart: unless-stopped
    ports:
      - "4880:8080"
  bambutag:
    image: ghcr.io/faioliii/bambutag:latest
    container_name: bambutag
    restart: unless-stopped
    ports:
      - "4080:80"
      - "4443:443"
```

---

## 🛠️ Usage

1. **Configure:** Click the gear icon (Settings) in the top right corner to add your BamBuddy URL and API Key.
2. **Write NFC:** Choose your spool from the list and write the information onto the NFC tag using your phone.
3. **Scan NFC:** Hold your phone near the tag to automatically open the assignment screen.
4. **Assign:** Select the desired printer and the corresponding AMS slot.

<div align="center">
  <table style="border: none; width: 100%; table-layout: fixed;">
    <tr>
      <td align="center" style="border: none; vertical-align: middle; padding: 5px;">
        <img src="Example_img/Overwiev.jpg" height="400" alt="Overview" style="max-width: 100%; border: none; box-shadow: none;">
      </td>
      <td align="center" style="border: none; vertical-align: middle; padding: 5px;">
        <img src="Example_img/settings.jpg" height="400" alt="Settings" style="max-width: 100%; border: none; box-shadow: none;">
      </td>
      <td align="center" style="border: none; vertical-align: middle; padding: 5px;">
        <img src="Example_img/assign_spool.jpg" height="400" alt="Assign Spool" style="max-width: 100%; border: none; box-shadow: none;">
      </td>
      <td align="center" style="border: none; vertical-align: middle; padding: 5px;">
        <img src="Example_img/Write_nfc.jpg" height="400" alt="Write NFC" style="max-width: 100%; border: none; box-shadow: none;">
      </td>
    </tr>
  </table>
</div>

---

## 📄 License

This project is licensed under the GNU General Public License v3.0. For further details, please refer to the `LICENSE` file in the repository.
