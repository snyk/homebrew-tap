class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1115.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1115.0/snyk-macos"
    sha256 "0aad5b3b4f11679cb37ad7f95726ea01cf4cd7ada3bd8a70fca3bc843791f260"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1115.0/snyk-linux"
    sha256 "9f13c7f7ff53984c9556185fb8945c5517b73934ca76538575e1ec998c086911"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
