cask "dropanddrag" do
  version "1.0.13"
  sha256 arm:   "0642af188bb6be634ac3872f88328e6d17d14571aea2870a6e27fa3c9c21ca1f",
         intel: "0642af188bb6be634ac3872f88328e6d17d14571aea2870a6e27fa3c9c21ca1f"
  url "https://github.com/tigranadamyan/DropAndDrag/releases/download/v#{version}/DropAndDrag-#{version}-macOS.dmg"
  name "DropAndDrag" 
  desc "Fast cross-platform drag-and-drop shelf utility"
  homepage "https://github.com/tigranadamyan/DropAndDrag"
  depends_on macos: :ventura
  app "DropAndDrag.app"
  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister", args: ["-f", "#{appdir}/DropAndDrag.app"]
    system_command "xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/DropAndDrag.app"], sudo: true
  end
  caveats "For shake-to-open: System Settings → Privacy & Security → Accessibility → enable DropAndDrag"
  zap trash: ["~/Library/Application Support/DropAndDrag", "~/Library/Preferences/com.dropanddrag.app.plist", "~/Library/Caches/DropAndDrag"]
end
