# Arch Ungoogled Updater

## Dependencies

This project depends on `bash curl html-xml-utils`

```
yay -S bash curl html-xml-utils
```

> You can use whatever AUR helper you want

## Installation

```
curl -o- https://raw.githubusercontent.com/Zaedus/ungoogled-updater/master/install.sh | bash
```

**OR**, if you're not lazy like me, you can download the script called `ungoogled-updater`, and put it wherever you want.

## FAQs

### 🔨 What does it do?

This is just a simple script intended to download the latest prebuilt binary from [this amazing project](https://github.com/ungoogled-software/ungoogled-chromium-binaries) and install it.

### ❓ What's the point of this?

Well a lot of the heavy lifting is already carried out by the aforementioned project that outsources the building process. This project is just meant to make the downloading process quick and easy.

### 🔺 Any plans for other distros?

So far, I only made this for Arch Linux but if this project gets some traction, I'll probably end up including other distros as well.
