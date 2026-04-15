cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.preview_02"
  sha256 arm:   "4b28282446eba520b657364ebcb166455ccc43a37352ce91c254b66160a44cae",
         intel: "a11db2c36f94a2e2d0d7b9c9ec6a158944a0b1d9d33a104a463bbcd94063d77b"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      channel = json["preview"]
      next if channel.nil?

      # Start with base channel values.
      version = channel["version"]
      cli_version = channel["cli_version"]

      # Apply macOS-specific override if present (mirrors the Rust apply_override logic:
      # `version` is always replaced; `cli_version` only if the override sets it).
      mac_override = channel["overrides"]&.find { |o| o.dig("predicate", "target_os") == "macos" }
      if mac_override
        info = mac_override["version_info"]
        version = info["version"] if info&.key?("version")
        cli_version = info["cli_version"] if info&.key?("cli_version")
      end

      # Prefer cli_version, fall back to version.
      (cli_version || version)&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
