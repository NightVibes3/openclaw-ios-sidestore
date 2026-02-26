# OpenClaw iOS (Sidestore Build)

Builds an unsigned IPA of the OpenClaw iOS app for use with Sidestore.

## What is this?

This is a standalone build of the OpenClaw iOS app configured to produce an **unsigned IPA** that can be installed via:
- **Sidestore** (AltStore alternative for sideloaded apps)
- **AltStore**
- **Xcode** sideload (unsigned)

## Usage

1. Clone this repo
2. Push to your GitHub
3. Run the workflow
4. Download the unsigned IPA from Actions
5. Install via Sidestore

## GitHub Actions

The workflow automatically builds an unsigned IPA on every push to main.

### To run manually:
1. Go to Actions tab
2. Select "Build iOS IPA (Sidestore)"
3. Click "Run workflow"

## Requirements

- iOS 18.0+
- Apple ID (for Sidestore)
- Sidestore app installed on iPhone/iPad

## Notes

- This build has limited/no push notification support (APNs)
- Uses generic iOS Simulator destination for building
- No code signing (unsigned)

## Source

Original source: https://github.com/openclaw/openclaw/tree/main/apps/ios
# test
# test
