<div align="center">
  <img src="BambuTag.png" width="500" alt="BambuTag-Logo">
  <br>
  <!--<em>Abb. 1: BambuTag Benutzeroberfläche auf einem Smartphone</em>-->
</div>

**BambuTag** is a modern, lightweight Progressive Web App (PWA) that turns your smartphone into a handy NFC scanner. With this application, you can easily expand **BamBuddy** (Spoolman) to scan or write NFC tags for filament spools directly using your mobile device, allowing you to assign them to printer AMS slots without needing a PC.

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

## 🌐 CORS (Cross-Origin Resource Sharing) Notice

If your BambuTag and BamBuddy instances are not hosted under the exact same domain, modern browsers will block the API requests with a CORS error. In this case, you will need to set up an API Proxy. 

**Recommended Proxy:** [`testcab/cors-anywhere:latest`]([https://hub.docker.com/r/testcab/cors-anywhere](https://hub.docker.com/r/testcab/cors-anywhere)).

---

## 🛠️ Requirements & Deployment via Docker Compose

To run the application via Docker on your server, simply create a `docker-compose.yml` file:

```yaml
services:
  bambutag:
    image: ghcr.io/faioliii/bambutag:latest
    container_name: bambutag
    restart: unless-stopped
    ports:
      - "8080:80"
```

Run the stack in the background using the following command:
```bash
docker compose up -d
```

---

## ⚙️ Usage

1. **Configure:** Click the gear icon (Settings) in the top right corner to add your BamBuddy URL and API Key.
2. **Write NFC:** Choose your spool from the list and write the information onto the NFC tag using your phone.
3. **Scan NFC:** Hold your phone near the tag to automatically open the assignment screen.
4. **Assign:** Select the desired printer and the corresponding AMS slot.

---

## 📄 License

This project is licensed under the GNU General Public License v3.0. For further details, please refer to the `LICENSE` file in the repository.
