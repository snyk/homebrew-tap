class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1181.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1181.0/snyk-macos"
    sha256 "f702cc388f9235f049c49934344780b1ab12d4f24c2db4acc8a26dfe84fd17a2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1181.0/snyk-linux"
    sha256 "32eb05ffb9a189b0da3991dbd75976442af5160a57cf7e82b610ed57fb6b7b29"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
