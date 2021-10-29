class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.747.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.747.0/snyk-macos"
    sha256 "eee8f10f846bef8f066c68d35fdb0b7a788905384ed3ed7d1d10584039be98d8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.747.0/snyk-linux"
    sha256 "f4b36d34fdf45e36d3ddb33e55934b40ed97d5947cf018c72e12c71c14286bf7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
