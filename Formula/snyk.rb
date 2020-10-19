class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.415.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.415.0/snyk-macos"
    sha256 "b0d7a6927e70f74cbce2cb25a99e76640876cdb545f5d3370bdf84d84dea767c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.415.0/snyk-linux"
    sha256 "9877ec4bd1a8a12f97e6e08db02ce9715192a861c83cd1c38ebbcd890018e356"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
