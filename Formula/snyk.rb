class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.317.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.317.0/snyk-macos"
    sha256 "91ea7def56a91bcea266773187c9c75ca5b94a7ad42df25ee32eab7427f12b5b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.317.0/snyk-linux"
    sha256 "0fa654bba2eaed83bb895f76c669173edff8826a7248c5d03d0b6e13b913817b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
