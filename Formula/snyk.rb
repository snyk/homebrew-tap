class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1126.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1126.0/snyk-macos"
    sha256 "04aad4e327cf2f136964e1a50511c20fe713231d6ce2478e006dece2853d0079"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1126.0/snyk-linux"
    sha256 "b902f238e0ac0e0883d62f11fbd97d5fdcda2a5dcedce89f1f79389959002bb0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
