cask "dropanddrag" do
  version "1.0.14"
  sha256 arm:   "585b2916089ee6ccb463e4346de13fea610c734da48ea4cea75a671fc927985b",
         intel: "585b2916089ee6ccb463e4346de13fea610c734da48ea4cea75a671fc927985b"
  url "https://github.com/tigranadamyan/DropAndDrag/releases/download/v#{version}/DropAndDrag-#{version}-macOS.dmg"
  name "DropAndDrag" 
  desc "Fast cross-platform drag-and-drop shelf utility"
  homepage "https://github.com/tigranadamyan/DropAndDrag"
  depends_on macos: :ventura
  app "DropAndDrag.app"
  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister", args: ["-f", "#{appdir}/DropAndDrag.app"]
    system_command "xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/DropAndDrag.app"]
  end
  caveats "For shake-to-open: System Settings → Privacy & Security → Accessibility → enable DropAndDrag"
  zap trash: ["~/Library/Application Support/DropAndDrag", "~/Library/Preferences/com.dropanddrag.app.plist", "~/Library/Caches/DropAndDrag"]
end
