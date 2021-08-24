class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.687.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.687.0/snyk-macos"
    sha256 "a491858d72bb2179cc25d5bcbd4610c3dd2662a7d75f14af3a03d26c09a9a6c2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.687.0/snyk-linux"
    sha256 "e820551f47247e20a763922d843c934a0ddea39c84a89fece3c3dcbbe56bae83"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
