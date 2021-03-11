class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.483.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.483.0/snyk-macos"
    sha256 "22a0593bb074a55d9ce310bf5615ca09786a19e9a894698d157e2d9c961eade8"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.483.0/snyk-linux"
    sha256 "135a6e7b5c1432309ba1206ccbec880087e2788f6da7db0cd91f45e6a738dd40"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
