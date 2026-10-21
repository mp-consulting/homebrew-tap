class Homeswift < Formula
  desc "HomeKit Accessory Protocol in Swift, with a demo HomeKit bridge"
  homepage "https://github.com/mp-consulting/homeswift"
  url "https://github.com/mp-consulting/homeswift/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5df454764abb272f6293d466a43d85e17e96c5455eebe5d23043b4482acd3376"
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
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "homeswift-demo"
    bin.install ".build/release/homeswift-demo"
  end

  service do
    run opt_bin/"homeswift-demo"
    keep_alive true
    log_path var/"log/homeswift.log"
    error_log_path var/"log/homeswift.log"
  end

  def caveats
    <<~EOS
      Run the demo bridge and pair it in the Home app with the setup code it prints:
        homeswift-demo
      Or keep it running in the background:
        brew services start homeswift
      The setup code is then in #{var}/log/homeswift.log.
      State is kept in ~/.homeswift/homeswift-demo.json; delete it to start over.
    EOS
  end

  test do
    assert_match "usage: homeswift-demo", shell_output("#{bin}/homeswift-demo --help")
  end
end
