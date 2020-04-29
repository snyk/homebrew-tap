class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.314.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.314.0/snyk-macos"
    sha256 "c91e58c8cba8f019bae88de43042c644bad9e06cb09284011249d3676b868283"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.314.0/snyk-linux"
    sha256 "1abc6aaf06fb3f8d867096afa53d8dddc14417398569137cef51f765d43c1b0f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
