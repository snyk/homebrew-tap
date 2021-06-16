class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.631.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.631.0/snyk-macos"
    sha256 "bd05c322923b82c77b0afbb14d36d4c2091eb7bee9458f35264c20e282965cf1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.631.0/snyk-linux"
    sha256 "4d2e35058bfd9a26214eb6ea1e8e02debf32d9ad6e1e683bd644042a5421d56a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
