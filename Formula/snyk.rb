class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1244.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1244.0/snyk-macos"
    sha256 "9f1561131909ffabf52f6577ca0cb54fb5db687e7acac0b8729f3d1815ae7fec"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1244.0/snyk-macos-arm64"
    sha256 "5c1888bcdd334e546c47af0126f44d3b6042fef40a0029b3cc9435ccd732d343"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1244.0/snyk-linux"
    sha256 "edc6eaa60002a0e8f2760932828b5c37672a4141eec20ae6d480d4cfbb4347c4"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1244.0/snyk-linux-arm64"
    sha256 "4522f2461fe6c9867f527faf2b1aeb1037edd2038822f2da8c3f2d58de0bd12e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
