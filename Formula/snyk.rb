class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.532.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.532.0/snyk-macos"
    sha256 "62fa3f6a71dfeefc54544406a0134cf27656f06ad6eadf65a594150782a91e61"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.532.0/snyk-linux"
    sha256 "ed4e82f40cce59d03790dcc060bf298bc92002704cf2616ccbf9f09a77b4b3ce"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
