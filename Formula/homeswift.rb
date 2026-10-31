class Homeswift < Formula
  desc "HomeKit bridge in Swift that runs Homebridge-style plugins"
  homepage "https://github.com/mp-consulting/homeswift"
  url "https://github.com/mp-consulting/homeswift/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "a99d60e9da5441ef65c0ee9e6816fde7d6f58e3904161195bf1b29f953b53251"
  license "MIT"
  head "https://github.com/mp-consulting/homeswift.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Swift 6.1 (Xcode 16.3 or its Command Line Tools) needs macOS 15.
  depends_on macos: :sequoia
  uses_from_macos "swift" => :build

  def install
    %w[homeswift homeswift-demo].each do |product|
      system "swift", "build", "--disable-sandbox", "-c", "release", "--product", product
      bin.install ".build/release/#{product}"
    end
    # The notices of the projects Homeswift ports code from, and the licence texts they refer to.
    doc.install "THIRD-PARTY-NOTICES.md", "LICENSES"
  end

  service do
    run opt_bin/"homeswift"
    keep_alive true
    log_path var/"log/homeswift.log"
    error_log_path var/"log/homeswift.log"
  end

  def caveats
    <<~EOS
      Run the bridge and pair it in the Home app with the setup code it prints:
        homeswift
      Or keep it running in the background:
        brew services start homeswift
      The setup code is then in #{var}/log/homeswift.log.
      Plugins are configured in ~/.homeswift/config.json, created on the first run;
      `homeswift plugins` lists the ones compiled in.

      homeswift-demo is a single demo accessory with no configuration. Its state is kept
      in ~/.homeswift/homeswift-demo.json; delete it to start over.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/homeswift --version").strip
    assert_match "usage: homeswift-demo", shell_output("#{bin}/homeswift-demo --help")
  end
end
