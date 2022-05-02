class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.915.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.915.0/snyk-macos"
    sha256 "1dbfde0000f94b25c8d1c250675fcc71d09262823536d1381d1cc057b17bae10"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.915.0/snyk-linux"
    sha256 "da23eab8f124d14427850f2d2dfba023c667b31bc27a57e44f64a57bb0a34652"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
