class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.623.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.623.0/snyk-macos"
    sha256 "ed9807bc95c0c2830a8982d282e1ab1bc03110623bb97dceca6c34a91a67a629"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.623.0/snyk-linux"
    sha256 "93c9f9f4f7ea0081e2a5be5a879b43ab646eec883515ac51e6a24aef7ba20933"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
