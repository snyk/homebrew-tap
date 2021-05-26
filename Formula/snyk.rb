class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.608.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.608.0/snyk-macos"
    sha256 "eaaa8b53da7b3d326225b8c2a4e2bbd4a36fb8d568770c4291a91df56a47277e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.608.0/snyk-linux"
    sha256 "ca5feeea06d26b1592aab1dfa801a99d03312733ff1c095d3dbf32a21a776353"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
