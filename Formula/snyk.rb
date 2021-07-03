class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.653.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.653.0/snyk-macos"
    sha256 "ad5141cd38135f6d903fb700977e9fcc8f59cebbb73b8083b1ec04217dc5abc0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.653.0/snyk-linux"
    sha256 "66361fefb3a3dd5306c562c4c5529a5e95bcc77966ea09e4c8bc327acf4332f6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
