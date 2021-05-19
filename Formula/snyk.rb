class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.602.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.602.0/snyk-macos"
    sha256 "b856fba4ad8cc323e1ab5dde5ffa9831bbbc9cb2a96f6aff271c67fba1352b1d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.602.0/snyk-linux"
    sha256 "fd31af12f7da5631497608fe89d236daf0db67467930192c15708717a12b23ae"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
